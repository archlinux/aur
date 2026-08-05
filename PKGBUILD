# Maintainer: Markus Kalb <mk@filmkreis.tu-darmstadt.de>
# Maintainer: Benjamin Radel <aur@radel.tk>
# Contributor: Stefan Karner <stefan.karner@student.tuwien.ac.at>
pkgname=libasdcp-cth
_commit=467a54314c7b25e28f6df4c7ea03e9f8802fa525
pkgver=1.0.10
pkgrel=1
pkgdesc="open source implementation of SMPTE and the MXF Interop Sound & Picture Track File format."
arch=('i686' 'x86_64')
url="https://carlh.net/asdcplib"
license=('GPL-2.0-or-later')
depends=('libxml++2.6' 'boost-libs>=1.91.0' 'openssl')
makedepends=('git' 'python' 'pkg-config' 'boost')
source=("${pkgname}::git+https://git.carlh.net/git/asdcplib.git#tag=v${pkgver}")
sha256sums=('21ca9a37f129649532b9ef896728166e84c71728e763af0b6424f23f76145187')
conflicts=('asdcplib')
provides=('libasdcp-cth')

#pkgver() {
#    cd "$pkgname"
#    git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
#}

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
