# Maintainer: Antonio Rojas <arojas@archlinux.org>
# Contributor: FadeMind <fademind@gmail.com>
# Contributor: Zatherz <zatherz at linux dot pl>

pkgname=qt5ct-kde
_pkgname=qt5ct
pkgver=1.7
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
sha256sums=('ed58546a6e4c50dfed1b9ff6a148d4a468fe9b4d7b5b2727b96501de2955b8d7'
            '56872b502f8bf6a3475e4ad0678a2f46d4e1cd544d8324c133442704c2388f7f')

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

