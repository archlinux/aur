# Maintainer: Antonio Rojas <arojas@archlinux.org>
# Contributor: Martchus <martchus@gmx.net>

pkgname=qt6ct-kde
_pkgname=qt6ct
pkgver=0.9
pkgrel=16
pkgdesc='Qt 6 Configuration Utility, patched to work correctly with KDE applications'
arch=(x86_64)
url='https://github.com/trialuser02/qt6ct'
license=(BSD)
depends=(qqc2-desktop-style)
makedepends=(cmake qt6-tools)
conflicts=($_pkgname)
provides=($_pkgname)
source=(https://github.com/trialuser02/$_pkgname/releases/download/$pkgver/$_pkgname-$pkgver.tar.xz
        $_pkgname-shenanigans.patch)
sha256sums=('0a9f00db7f9c2003b33fad1715cbf2a483bf50a99079b97bf8e5d0bdbd3392cd'
            'cd9f571bde6d9122f6cde4ab11c19e4ae5218a85dbe77ef9c2692eef9c7dad71')

prepare() {
  patch -d $_pkgname-$pkgver -p1 < $_pkgname-shenanigans.patch # The magic
}

build() {
  cmake -B build -S $_pkgname-$pkgver \
    -DCMAKE_INSTALL_PREFIX=/usr
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
  install -Dm644 $_pkgname-$pkgver/COPYING "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
