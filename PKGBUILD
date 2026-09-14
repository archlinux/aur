# Maintainer: Sourav Gope <your-email@example.com>
pkgname=axel-gui-git
_pkgname=axel-gui
pkgver=r9.f03045c
pkgrel=1
pkgdesc="Modern Qt6 GUI wrapper for the Axel download accelerator with Firefox integration"
arch=('x86_64')
url="https://github.com/TheSerphh/AxelGUI"
license=('GPL-3.0-or-later')
depends=('qt6-base' 'axel' 'python')
makedepends=('git' 'clang' 'cmake' 'ninja')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("git+$url.git")
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir/AxelGUI"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

build() {
    cd "$srcdir/AxelGUI"
    export CC=clang
    export CXX=clang++

    cmake -B build -GNinja \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_EXPORT_COMPILE_COMMANDS=ON

    ninja -C build
}

package() {
    cd "$srcdir/AxelGUI"
    DESTDIR="$pkgdir" ninja -C build install
}
