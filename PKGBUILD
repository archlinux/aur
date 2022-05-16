# Maintainer: Markus Kalb <mk@filmkreis.tu-darmstadt.de>
# Maintainer: Benjamin Radel <aur@radel.tk>
# Contributor: Stefan Karner <stefan.karner@student.tuwien.ac.at>
pkgname=libasdcp-cth
pkgver=0.1.6
pkgrel=1
pkgdesc="open source implementation of SMPTE and the MXF Interop Sound & Picture Track File format."
arch=('i686' 'x86_64')
url="https://carlh.net/asdcplib"
license=('GPL')
depends=('libxml++2.6' 'boost-libs>=1.72.0' )
makedepends=('git' 'python' 'pkg-config' 'boost')
source=("${pkgname}-${pkgver}::git+git://git.carlh.net/git/asdcplib.git#tag=v${pkgver}")
sha256sums=('SKIP')
conflicts=('asdcplib')
provides=('libasdcp-cth')

prepare() {
    cd ${pkgname}-${pkgver}
    python waf configure --prefix=/usr
}

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    python waf build
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python waf install --destdir=$pkgdir
  cd "${pkgdir}"
  if [ -d usr/lib64  ]
  then
      mv usr/lib64 usr/lib
  fi
}
