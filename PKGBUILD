# Maintainer: Gabriel Maizo <maizogabriel@proton.me>

pkgname=kio-rclone
pkgver=0.3.1
pkgrel=1
pkgdesc='Browse rclone remotes from Dolphin and other KIO applications'
url='https://github.com/Undead34/kio-rclone'
arch=('x86_64')
license=('GPL-2.0-or-later')
depends=(
  'kcoreaddons'
  'kdbusaddons'
  'ki18n'
  'kio'
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
sha256sums=('f6fac951ae715e5eeaa91858bca80c9bfc2eb8d8d9a7eaa5c7f68abd45367d81')

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
