# Maintainer: Xtarii carlalvinelias@gmail.com

pkgname=osse-core
pkgver=0.2  # Version
pkgrel=2    # Version Release
pkgdesc="OpenSource Search Engine ( Core ) Library"

arch=('x86_64')
license=('Apache 2.0')

depends=()
makedepends=('cmake' 'make' 'gcc')

url="https://github.com/Xtarii/OSSE-Core"
source=("$url/archive/refs/tags/v$pkgver-$pkgrel.tar.gz")
sha256sums=('SKIP')



build() {
    echo -e "\033[33mBuilds Package...\033[0m"

    local cmake_options=(
        -B build
        -S "OSSE-Core-$pkgver-$pkgrel"

        # Options for CMAKE
        -DCMAKE_INSTALL_PREFIX=/usr
    )
    cmake "${cmake_options[@]}"
    cmake --build build

    echo -e "\033[34mBuild Done\033[0m"
}

package() {
    echo -e "\033[33mInstalls Package...\033[0m"

    DESTDIR="$pkgdir" cmake --install build

    install -Dm644 "OSSE-Core-$pkgver-$pkgrel/LICENSE" \
        "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

    echo -e "\033[34mInstallation Done\033[0m"
}
