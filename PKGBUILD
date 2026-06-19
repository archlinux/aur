# Maintainer: Nico <d3sox at protonmail dot com>

pkgname=kwin-effects-better-blur-dx
pkgver=2.4.1
pkgrel=2
pkgdesc="KWin Better Blur DX effect fork with window class force blur feature (Wayland)"
arch=('x86_64')
url="https://github.com/xarblu/kwin-effects-better-blur-dx"
license=(GPL-3.0-or-later)
depends=(kio knotifications kcrash kglobalaccel kcmutils libepoxy kwin vulkan-headers)
conflicts=("kwin-effects-forceblur")
replaces=("kwin-effects-forceblur")
makedepends=(cmake extra-cmake-modules qt6-tools kwin)
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
install="$pkgname.install"
sha256sums=('e039cdfce81d93761bcf2baeade9d1b2ba83a899ec2954ddf62760a758bf7905')

build() {
    local _cmake_args=(
        -B build
        -S "$pkgname-$pkgver"
        -W no-dev
        -D CMAKE_BUILD_TYPE=None
        -D CMAKE_INSTALL_PREFIX=/usr
        -D BETTERBLUR_X11=OFF
    )

    cmake "${_cmake_args[@]}"
    cmake --build build
}

package() {
    DESTDIR="${pkgdir}" cmake --install build
}
