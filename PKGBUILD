# Maintainer: Antonio Rojas <arojas@archlinux.org>
# Contributor: FadeMind <fademind@gmail.com>
# Contributor: Zatherz <zatherz at linux dot pl>

pkgname=qt5ct-kde
_pkgname=qt5ct
pkgver=1.5
pkgrel=1
pkgdesc='Qt5 Configuration Utility, patched to work correctly with KDE applications'
arch=(x86_64)
url='https://qt5ct.sourceforge.io/'
license=(BSD)
depends=(qqc2-desktop-style)
makedepends=(cmake qt5-tools)
conflicts=(qt5ct)
provides=(qt5ct)
source=(https://downloads.sourceforge.net/project/$_pkgname/$_pkgname-$pkgver.tar.bz2
        qt5ct-shenanigans.patch)
sha256sums=('d63d0ce16e02427207d86531f70a71c5b9c850044dd5b2dcb2285531f416e490'
            '3e9d5ed24366a674fa5ab2df52d1e01fb956598b27ffb4e8e2d06ba7bb355aa0')

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

