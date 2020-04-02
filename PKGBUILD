# Maintainer: Kristóf Marussy <kris7topher at gmail dot com>

pkgname=libhidpp-pixlone-git
_pkgname="libhidpp"
_gitpkgname="hidpp"
pkgver=r152.8fa6d2b
pkgrel=1
pkgdesc="Collection of HID++ tools, PixlOne fork for logiops"
arch=('x86_64')
url="https://github.com/PixlOne/$_gitpkgname"
license=('GPL3')
depends=('libudev.so' 'tinyxml2')
makedepends=('git' 'cmake')
conflicts=("${_pkgname-*}" "${_pkgname-*}-git")
provides=("${_pkgname-*}" "${_pkgname-*}-git")
source=("git+https://github.com/PixlOne/$_gitpkgname")
sha256sums=('SKIP')

pkgver() {
    cd "$_gitpkgname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "$_gitpkgname"
    mkdir -p build
    cd build
    rm -rf *
    cmake .. \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_BUILD_TYPE=Release
    make
}

package() {
    cd "$_gitpkgname/build"
    make install DESTDIR="$pkgdir"
}
