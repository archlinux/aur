# Maintainer: Antonio Rojas <arojas@archlinux.org>
# Contributor: FadeMind <fademind@gmail.com>
# Contributor: Zatherz <zatherz at linux dot pl>

pkgname=qt5ct-kde
_pkgname=qt5ct
pkgver=1.3
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
sha256sums=('dd443b14e590aff76a16e1316d56e688882e3248c470df4f71bc952569f3c3bc'
            'bdac1e0bf247e2ae054f3ad5f8069b41f84ac60740a1afa9e9433908c71ae0f4')

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

