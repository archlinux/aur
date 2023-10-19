# Maintainer: ju6ge <judge@felixrichter.tech>

pkgname=hy3-git
_pkgname=hy3
pkgver=r209.65a849b
pkgrel=3
pkgdesc='Hyprland plugin for i3 like tiling'
arch=('x86_64')
url='https://github.com/outfoxxed/hy3'
license=('GPL3')
makedepends=('git')
depends=('gcc-libs' 'glibc' 'hyprland')
makedepends=('cmake' 'git')
source=("git+$url")
sha256sums=('SKIP')
conflicts=("hy3")

pkgver() {
    cd "$_pkgname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

build() {
    cmake -B build -S "$_pkgname" -DCMAKE_BUILD_TYPE=Debug -DCMAKE_INSTALL_PREFIX='/usr'
    cmake --build build
}

package() {
    DESTDIR="$pkgdir" cmake --install build
}
