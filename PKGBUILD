# Maintainer: Gvrzizo <akoholic@outlook.com>
pkgname=lazy-tui-git
pkgver=0.2.0.r1.ge5502d9
pkgrel=1
pkgdesc="Learning at ZJU Yes TUI (git)"
arch=('x86_64')
url="https://github.com/Gvrzizo/lazy-tui"
license=('LGPL-3.0-only')
provides=('lazy-tui')
conflicts=('lazy-tui')
source=("git+$url.git")
sha256sums=('SKIP')
depends=('lazy-cli')
makedepends=('git' 'cmake' 'make')

pkgver() {
    cd "$srcdir/lazy-tui"
    git describe --tags --long | sed 's/^v//;s/-/.r/;s/-/./'
} 

build() {
    cd "$srcdir/lazy-tui"
    mkdir -p build
    cd build
    cmake .. -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr
    make -j
}

package() {
    cd "$srcdir/lazy-tui/build"
    make DESTDIR="$pkgdir" install
}
