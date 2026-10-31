# Maintainer: Blaadick <null>

pkgname="bsu"
pkgdesc="Blaad's System Utilities"
url="https://github.com/Blaadick/BSU"
license=("GPL-3.0-or-later")
pkgver="0.1.0"
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
sha512sums=('dc5fe167f49a592dafdda7dbf0c6230398cd77eb97fdce38b54aa0340818849c331792a77e935030a3e290334cbc1e730a56a7d12f364a9fe10d176373805ec6')

build() {
    cd "BSU-$pkgver"

    cmake -B cmake-build-release-linux -S . -G Ninja -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr
    cmake --build cmake-build-release-linux --parallel
}

package() {
    cd "BSU-$pkgver"

    DESTDIR="$pkgdir" cmake --install cmake-build-release-linux
}
