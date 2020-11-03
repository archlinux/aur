# Maintainer: Robert Falkenberg <robert.falkenberg@tu-dortmund.de>

pkgbase=c-mnalib
pkgname=$pkgbase
pkgver=0.1
_pkgver=falcon_v${pkgver}
pkgrel=1
pkgdesc='C library for easy access and configuration of cellular network modems'
arch=('x86_64' 'arm')
url='https://github.com/falkenber9/c-mnalib'
license=('MIT')
depends=('curl' 'glib2' 'systemd-libs')
makedepends=('cmake')
options=(staticlibs)
source=("${pkgname}-${_pkgver}.tar.gz::https://github.com/falkenber9/c-mnalib/archive/${_pkgver}.tar.gz")
sha512sums=('768e44b18016e97377ff4414a6674f2be3d93f05cbe2d6d252f7796745173f4c90b7d71b5fa442fd2c5cf12e524cabf8a6e971a1126a9a0e7baa41e4cf7c27d5')

build() {
  echo 'Building C-mnalib'

  cmake .. \
    -B "${pkgname}-${_pkgver}-build" \
    -S "${pkgname}-${_pkgver}" \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=Release \
    -DENABLE_GENERIC=True

  make -C "${pkgname}-${_pkgver}-build" -j 4
}

package() {
  make -C "${pkgname}-${_pkgver}-build" DESTDIR="$pkgdir" install
  cd $srcdir/${pkgname}-${_pkgver}
  install -Dm644 LICENSE.md "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
