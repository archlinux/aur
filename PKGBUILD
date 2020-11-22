# Maintainer: Robert Falkenberg <robert.falkenberg@tu-dortmund.de>

pkgbase=c-mnalib
pkgname=$pkgbase
pkgver=1.0.0
_pkgver=v${pkgver}
pkgrel=1
pkgdesc='C library for easy access and configuration of cellular network modems'
arch=('x86_64' 'arm')
url='https://github.com/falkenber9/c-mnalib'
license=('MIT')
depends=('curl' 'glib2' 'systemd-libs')
makedepends=('cmake')
options=(staticlibs)
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/falkenber9/c-mnalib/archive/${_pkgver}.tar.gz")
sha512sums=('dbccefda3e1a2c8dab970a092b6cf91fbf8ead275a958c1e732769fb1220ccc18248ec4677de10d4e2cf33e9966806861b5f898d4e64d28959948725170aafba')

build() {
  echo 'Building C-mnalib'

  cmake .. \
    -B "${pkgname}-${pkgver}-build" \
    -S "${pkgname}-${pkgver}" \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=Release \
    -DENABLE_GENERIC=True

  make -C "${pkgname}-${pkgver}-build" -j 4
}

package() {
  make -C "${pkgname}-${pkgver}-build" DESTDIR="$pkgdir" install
  cd $srcdir/${pkgname}-${pkgver}
  install -Dm644 LICENSE.md "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
