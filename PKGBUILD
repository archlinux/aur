# Maintainer: Nico <d3sox at protonmail dot com>

pkgname=kwin-effects-better-blur-dx-x11
pkgver=2.3.0
pkgrel=1
pkgdesc="KWin Better Blur DX effect fork with window class force blur feature (X11)"
arch=('x86_64')
url="https://github.com/xarblu/kwin-effects-better-blur-dx"
license=(GPL-3.0-or-later)
depends=(kio knotifications kcrash kglobalaccel kcmutils libepoxy kwin-x11)
conflicts=("kwin-effects-forceblur")
makedepends=(cmake extra-cmake-modules qt6-tools kwin-x11)
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
install="$pkgname.install"
sha256sums=('4f9945a05e0e6fffc9cc5f0bb012046e2b0fe6f848af07a8b5b3f94b7b4a2fca')

build() {
    local _cmake_args=(
        -B build
        -S "${pkgname%-x11}-$pkgver"
        -W no-dev
        -D CMAKE_BUILD_TYPE=None
        -D CMAKE_INSTALL_PREFIX=/usr
        -D BETTERBLUR_X11=ON
    )

    cmake "${_cmake_args[@]}"
    cmake --build build
}

package() {
    DESTDIR="${pkgdir}" cmake --install build
}
