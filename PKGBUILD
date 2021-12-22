# Maintainer: Ben Brown <benjamb at pm dot me>
pkgname=dlt-viewer-git
pkgver=2.21.2.r0.g6b336ee
pkgrel=1
pkgdesc="Diagnostic Log and Trace viewing program"
url="https://github.com/COVESA/dlt-viewer"
arch=('x86_64')
license=('MPL2')
depends=('qt5-base' 'qt5-serialport')
makedepends=('git')
provides=("${pkgname%-*}")
conflicts=("${pkgname%-*}")
source=("${pkgname%-*}::git+$url")
sha256sums=('SKIP')

pkgver() {
  cd "${pkgname%-*}"
  git describe --tags --long | sed 's/^v//;s/[^-]*-g/r&/;s/-/./g'
}

build() {
  cd "${pkgname%-*}"
  qmake BuildDltViewer.pro \
    QMAKE_CFLAGS="${CFLAGS}" \
    QMAKE_CXXFLAGS="${CXXFLAGS}" \
    QMAKE_LFLAGS="${LDFLAGS}"
  make
}

package() {
  cd "${pkgname%-*}"
  make INSTALL_ROOT="${pkgdir}" install
}
