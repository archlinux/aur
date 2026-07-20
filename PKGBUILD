# Maintainer: Gabriel Maizo <maizogabriel@proton.me>

pkgname=kio-rclone
pkgver=0.4.2
pkgrel=1
pkgdesc='Browse rclone remotes from Dolphin and other KIO applications'
url='https://undead34.github.io/kio-rclone/'
arch=('x86_64')
license=('GPL-2.0-or-later')
depends=(
  'kcoreaddons'
  'kdbusaddons'
  'ki18n'
  'kio'
  'kwindowsystem'
  'qt6-base'
  'rclone'
)
makedepends=(
  'cmake'
  'extra-cmake-modules'
  'ninja'
)
options=('!debug')
source=("$pkgname-$pkgver.tar.gz::https://github.com/Undead34/kio-rclone/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('08071b402a52d2f732083a01d9ae0bfaee5410b44708e504e46e5f53521a6a2a')

build() {
  cmake \
    -S "$srcdir/$pkgname-$pkgver" \
    -B "$srcdir/build" \
    -G Ninja \
    -DCMAKE_BUILD_TYPE=RelWithDebInfo \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DBUILD_TESTING=ON
  cmake --build "$srcdir/build"
}

check() {
  ctest --test-dir "$srcdir/build" --output-on-failure
}

package() {
  DESTDIR="$pkgdir" cmake --install "$srcdir/build"
}
