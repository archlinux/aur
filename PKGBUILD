# Maintainer: Dominik Nakamura <dnaka91@gmail.com>
# https://github.com/dnaka91/pkgbuilds

pkgname=obs-stroke-glow-shadow
pkgver=1.5.1
pkgrel=1
pkgdesc="OBS plugin to provide efficient Stroke, Glow, and Shadow effects on masked sources"
arch=('x86_64')
url="https://github.com/FiniteSingularity/obs-stroke-glow-shadow"
license=('GPL-2.0-or-later')
depends=('gcc-libs' 'glibc' 'obs-studio')
makedepends=('cmake')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
b2sums=('059bd4a4f5405f030395ac5ec6213a9d89652d38c9ec3191431e4952edae60c9c1db6b4b725a1edea52d08cbed44d90004c87d6443d3c5846e031d0ec813994d')

build() {
  cmake -B build -S "$pkgbase-$pkgver" \
    -DCMAKE_INSTALL_PREFIX="$pkgdir"/usr \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_C_FLAGS="-Wno-stringop-overflow" \
    -DLINUX_PORTABLE=OFF
  cmake --build build
}

package() {
  cmake --install build
}
