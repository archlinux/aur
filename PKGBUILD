# Maintainer: Antonio Rojas <arojas@archlinux.org>
# Contributor: Martchus <martchus@gmx.net>

pkgname=qt6ct-kde
_pkgname=qt6ct
pkgver=0.10
pkgrel=2
pkgdesc='Qt 6 Configuration Utility, patched to work correctly with KDE applications'
arch=(x86_64)
url='https://www.opencode.net/trialuser/qt6ct'
license=(BSD)
depends=(qqc2-desktop-style)
makedepends=(cmake git qt6-tools)
conflicts=($_pkgname)
provides=($_pkgname)
source=(git+https://www.opencode.net/trialuser/qt6ct#tag=$pkgver
        $_pkgname-shenanigans.patch)
sha256sums=('f84b4bdfc9f9dde188b73b2070a9fa81a154d414b72285cc4b945b1e89108fc0'
            'f0fb662d5fec7f5521ab3e6943eeae473a9c090ec6a418a95649a5235a7d73a3')

prepare() {
  patch -d $_pkgname -p1 < $_pkgname-shenanigans.patch # The magic
}

build() {
  cmake -B build -S $_pkgname \
    -DCMAKE_INSTALL_PREFIX=/usr
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
  install -Dm644 $_pkgname/COPYING "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
