# Contributor: Balló György <ballogyor+arch at gmail dot com>

pkgname=kookbook
pkgver=0.3.0
pkgrel=1
pkgdesc='Simplistic recipe manager that will help you to maintain a collection of your favorite recipes'
arch=(x86_64)
url='https://apps.kde.org/kookbook/'
license=(MIT)
depends=(
  glibc
  hicolor-icon-theme
  kirigami
  libstdc++
  qt6-base
  qt6-declarative
)
makedepends=(
  cmake
  extra-cmake-modules
  git
  ninja
)
source=("git+https://invent.kde.org/utilities/kookbook.git?signed#tag=v$pkgver")
b2sums=(febea80a4cdbd7547e4df66d2fcfb020f5190e58a1a3423d74e0b7b7fac826f1906cd0883ee2ed04c60cbff36dd856647c61fbf1482d98626d823ad85caaa0f0)
validpgpkeys=(8514067B1F1F5DF4E79DE0801A30765DF1F0D3ED) # Sune Vuorela <sune@vuorela.dk>

build() {
  cmake -S $pkgname -B build -G Ninja \
    -D CMAKE_INSTALL_PREFIX=/usr \
    -D CMAKE_BUILD_TYPE=None
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" $pkgname/COPYING
}
