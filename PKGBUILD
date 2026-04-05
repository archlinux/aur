# Maintainer: rsp4jack <rsp4jack+aur<at>outlook.com>
pkgname=kwin-zones-git
pkgver=1.0.11.r13.gc3a930d
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
    git describe --long --tags --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
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
