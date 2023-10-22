# Maintainer: Markus Kalb <mk@filmkreis.tu-darmstadt.de>
# Maintainer: Benjamin Radel <aur@radel.tk>
# Contributor: Stefan Karner <stefan.karner@student.tuwien.ac.at>
pkgname=libasdcp-cth
_commit=8a4a2f25cac0c58aac1d4267facab20e5ec3b57f
pkgver=0.1.6.r22.g8a4a2f2
pkgrel=1
pkgdesc="open source implementation of SMPTE and the MXF Interop Sound & Picture Track File format."
arch=('i686' 'x86_64')
url="https://carlh.net/asdcplib"
license=('GPL')
depends=('libxml++2.6' 'boost-libs>=1.72.0' 'openssl')
makedepends=('git' 'python' 'pkg-config' 'boost')
source=("${pkgname}::git+git://git.carlh.net/git/asdcplib.git#commit=${_commit}")
sha256sums=('SKIP')
conflicts=('asdcplib')
provides=('libasdcp-cth')

pkgver() {
    cd "$pkgname"
    git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd "${srcdir}/${pkgname}"
    python waf configure --prefix=/usr
    python waf build
}

package() {
  cd "${srcdir}/${pkgname}"
  python waf install --destdir="$pkgdir"
  cd "${pkgdir}"
  if [ -d usr/lib64  ]
  then
      mv usr/lib64 usr/lib
  fi
}
