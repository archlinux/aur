# Maintainer: Devin Lin <devin@kde.org>
# Contributor: Bernhard Landauer <bernhard@manjaro.org>

pkgname=kirigami-addons
pkgver=0.3
pkgrel=1
epoch=1
pkgdesc="Add-ons for the Kirigami framework"
arch=(x86_64 i686 i486 pentium4 arm armv6h armv7h aarch64)
url="https://invent.kde.org/libraries/$pkgname"
license=(GPL3)
depends=(ki18n kirigami2)
makedepends=(cmake extra-cmake-modules git)
provides=("$pkgname-git")
conflicts=("$pkgname-git")
source=("https://download.kde.org/unstable/$pkgname/$pkgver/$pkgname-$pkgver.tar.xz")
sha256sums=('946fd46f7453a2bb027f55fb29fc6a6d5ecdc8af25e049a8a01710d332195d77')

prepare() {
  mkdir -p build
}

build() {
  cmake -B build -S "${pkgname}-${pkgver}" \
    -DCMAKE_BUILD_TYPE=Release \
    -DBUILD_TESTING=OFF
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}

