# Maintainer: Gabriel Maizo <maizogabriel@proton.me>

pkgname=kio-rclone
pkgver=0.4.1
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
sha256sums=('05a1323a7483544b2e956ab1401ebd52a54d02d2dcf60b931dff9162481fe2c4')

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
