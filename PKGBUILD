# Maintainer: Krzysztof Demir Kuźniak <krzysztofdemirkuzniak@gmail.com>
pkgname=chatgpt-desktop-unix-git
pkgver=0.0.1
pkgrel=1
pkgdesc="Unofficial ChatGPT desktop app for Linux and BSD (Qt6, CMake)"
arch=('x86_64')
url="https://aur.archlinux.org/packages/chatgpt-desktop-unix-git"
license=('GPL3')
depends=('qt6-base' 'qt6-webengine' 'libgl' 'cups')
makedepends=('cmake' 'git' 'ninja' 'qt6-tools')
source=("git+https://aur.archlinux.org/chatgpt-desktop-unix-git.git")
md5sums=('SKIP')  # Skip for git sources

build() {
    cd "$srcdir/$pkgname"
    mkdir -p build
    cd build
    cmake .. \
        -G Ninja \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr
    ninja
}

package() {
    cd "$srcdir/$pkgname/build"
    DESTDIR="$pkgdir" ninja install
}
