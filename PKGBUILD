# Maintainer: Antonio Rojas <arojas@archlinux.org>
# Contributor: Martchus <martchus@gmx.net>

pkgname=qt6ct-kde
_pkgname=qt6ct
pkgver=0.11
pkgrel=5
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
sha256sums=('76bfc26838b8ec7dd049da54bd812d8c526986024845a30d1e546e43555e52bf'
            '55930246c54a94be02875dc21bc57e9ecfb7ef1ba40120112b0aa898928dfdc5')

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
