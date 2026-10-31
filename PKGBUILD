# Maintainer: Blaadick <null>

pkgname="bsu"
pkgdesc="Blaad's System Utilities"
url="https://github.com/Blaadick/BSU"
license=("GPL-3.0-or-later")
pkgver="0.1.1"
pkgrel=1
arch=("x86_64")
depends=(
    "glibc"
    "libgcc"
    "libstdc++"
    "glib2"
    "libsecret"
)
makedepends=(
    "cmake"
    "ninja"
)
source=("bsu-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha512sums=('1f626792a5a87e0586f944a8985339377abda7bdbda205f1bfe43005eaae49ebccaf049a3476bc945ca393182e8037649c5e65fe3fde9b5f8a0c1ecbf98f15c9')

build() {
    cd "BSU-$pkgver"

    cmake -B cmake-build-release-linux -S . -G Ninja -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr
    cmake --build cmake-build-release-linux --parallel
}

package() {
    cd "BSU-$pkgver"

    DESTDIR="$pkgdir" cmake --install cmake-build-release-linux
}
