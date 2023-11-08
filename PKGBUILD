# Maintainer: Antonio Rojas <arojas@archlinux.org>
# Contributor: FadeMind <fademind@gmail.com>
# Contributor: Zatherz <zatherz at linux dot pl>

pkgname=qt5ct-kde
_pkgname=qt5ct
pkgver=1.8
pkgrel=1
pkgdesc='Qt5 Configuration Utility, patched to work correctly with KDE applications'
arch=(x86_64)
url='https://qt5ct.sourceforge.io/'
license=(BSD)
depends=(qqc2-desktop-style5)
makedepends=(cmake qt5-tools)
conflicts=(qt5ct)
provides=(qt5ct)
source=(https://downloads.sourceforge.net/project/$_pkgname/$_pkgname-$pkgver.tar.bz2
        qt5ct-shenanigans.patch)
sha256sums=('23b74054415ea4124328772ef9a6f95083a9b86569e128034a3ff75dfad808e9'
            '7f31cc741b386588f5dcc90433d21817ac07ab3a1b419a740a32c05b0087e1e9')

prepare() {
  patch -d $_pkgname-$pkgver -p1 < qt5ct-shenanigans.patch # The magic
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

