# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Maintainer: Antonio Rojas <arojas@archlinuxo.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgname=cervisia
pkgver=17.04.2
pkgrel=1
pkgdesc='CVS Frontend'
url='https://kde.org/applications/development/cervisia/'
arch=(i686 x86_64)
license=(GPL LGPL FDL)
groups=(kde-applications kdesdk)
depends=(kdesu kparts hicolor-icon-theme)
makedepends=(extra-cmake-modules python kdoctools)
conflicts=(kdesdk-cervisia)
replaces=(kdesdk-cervisia)
source=("https://download.kde.org/stable/applications/$pkgver/src/$pkgname-$pkgver.tar.xz"{,.sig})
sha256sums=('0f0f1bf975a995225d2aad0d861a4f9b8324f99ee7516edd61d7ce9d7a4659bd'
            'SKIP')
validpgpkeys=(CA262C6C83DE4D2FB28A332A3A6A4DB839EAA6D7) # Albert Astals Cid <aacid@kde.org>

prepare() {
  mkdir -p build
}

build() {
  cd build
  cmake ../$pkgname-$pkgver \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DKDE_INSTALL_LIBDIR=lib \
    -DBUILD_TESTING=OFF
  make
}

package() {
  cd build
  make DESTDIR="$pkgdir" install
}
