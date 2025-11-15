# Maintainer: rsp4jack <rsp4jack+aur<at>outlook.com>
pkgname=kwin-zones-git
pkgver=0.1.r56.33767fb
pkgrel=1
pkgdesc="Experimental implementation of ext-zones Wayland protocol for KWin"
arch=('x86_64')
url="https://invent.kde.org/automotive/kwin-zones"
license=('CC0-1.0')
depends=(gcc-libs glibc kconfig kwin qt6-base qt6-wayland wayland wayland-protocols)
optdepends=(freetype2 fontconfig libglvnd vulkan-headers)
makedepends=('cmake' 'pkgconf' 'extra-cmake-modules' 'git')
provides=('kwin-zones')
source=("$pkgname::git+$url.git")
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir/$pkgname"
    printf "0.1.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

prepare() {
    cd "$srcdir/$pkgname"
}

build() {
    cd "$srcdir/$pkgname"
    cmake -B build -W no-dev -D CMAKE_BUILD_TYPE=None -D CMAKE_INSTALL_PREFIX=/usr
    cmake --build build -j
}

package() {
    cd "$srcdir/$pkgname"
    DESTDIR="$pkgdir" cmake --install build
}
