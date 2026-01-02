# Maintainer: Nico <d3sox at protonmail dot com>

pkgname=kwin-effects-better-blur-dx-x11
pkgver=2.0.0
pkgrel=2
pkgdesc="KWin Better Blur DX effect fork with window class force blur feature (X11)"
arch=(x86_64)
url="https://github.com/xarblu/kwin-effects-better-blur-dx"
license=(GPL-3.0-or-later)
depends=(kio knotifications kcrash kglobalaccel kcmutils libepoxy kwin-x11)
conflicts=("kwin-effects-forceblur")
makedepends=(extra-cmake-modules qt6-tools kwin-x11)
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
install="$pkgname.install"
sha256sums=('d9e66be7e6d1ca6f575e3f3383bc721096b47eb95c7f01b901446d862ffa5784')

build() {
    local _cmake_args=(-DCMAKE_INSTALL_PREFIX=/usr -DBETTERBLUR_X11=ON)
    local _srcdir="${pkgname%-x11}-$pkgver"

    cmake "${_cmake_args[@]}" -B build -S "$_srcdir"
    cmake --build build
}

package() {
    DESTDIR="${pkgdir}" cmake --install build
}
