# Maintainer: Blaadick <null>

pkgname="bsu-git"
pkgdesc="Blaad's System Utilities (latest commit from master)"
url="https://github.com/Blaadick/BSU"
license=("GPL-3.0-or-later")
pkgver="0.1.0.r0.g2430ff9"
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
    "git"
    "cmake"
    "ninja"
)
provides=("bsu")
conflicts=("bsu")
source=("bsu::git+$url.git")
sha512sums=("SKIP")

pkgver() {
    cd "bsu"

    git describe --long --tags --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd "bsu"

    cmake -B cmake-build-release-linux -S . -G Ninja -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr
    cmake --build cmake-build-release-linux --parallel
}

package() {
    cd "bsu"

    DESTDIR="$pkgdir" cmake --install cmake-build-release-linux
}
