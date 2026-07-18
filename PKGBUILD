# Maintainer: Gabriel Maizo <maizogabriel@proton.me>

pkgname=kio-rclone
pkgver=0.4.0
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
sha256sums=('713fb6acf8c49906d9d56e92e72bdcdcd929bc70d008e9f6025edcf4b5d9ff68')

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
