# Maintainer: Antonio Rojas <arojas@archlinux.org>
# Contributor: FadeMind <fademind@gmail.com>
# Contributor: Zatherz <zatherz at linux dot pl>

pkgname=qt5ct-kde
_pkgname=qt5ct
pkgver=1.8
pkgrel=2
pkgdesc='Qt5 Configuration Utility, patched to work correctly with KDE applications'
arch=(x86_64)
url='https://qt5ct.sourceforge.io/'
license=(BSD)
depends=(qqc2-desktop-style5)
makedepends=(cmake qt5-tools)
conflicts=($_pkgname)
provides=($_pkgname)
source=(https://downloads.sourceforge.net/project/$_pkgname/$_pkgname-$pkgver.tar.bz2
        $_pkgname-shenanigans.patch)
sha256sums=('23b74054415ea4124328772ef9a6f95083a9b86569e128034a3ff75dfad808e9'
            '63c51ffc1fbad13020fb61358b811fa249b173d41d7b573e9b1374e77a2a64f8')

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
