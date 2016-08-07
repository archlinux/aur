# Maintainer: Thibault 'Ryp' Schueller  <ryp.sqrt@gmail.com>

_gitname=vita-toolchain
pkgname=vita-toolchain-git
pkgver=r71.8a5048d
pkgrel=1
pkgdesc="Open source tools for PSP2"
arch=('any')
url="http://github.com/vitasdk/vita-toolchain"
license=('MIT')
makedepends=('git' 'cmake' 'jansson' 'elfutils' 'libzip')
conflicts=('vita-toolchain')
provides=('vita-toolchain')
# options=(!buildflags !strip !libtool)
source=('git+https://github.com/vitasdk/vita-toolchain.git#branch=master')
sha512sums=('SKIP')

pkgver() {
    cd "$srcdir/$_gitname"
#     git describe --long | sed -r 's/([^-]*-g)/r\1/;s/-/./g'
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "$srcdir/$_gitname"
    mkdir -p build && pushd build
    cmake "$srcdir/$_gitname"               \
        -DCMAKE_INSTALL_PREFIX=/usr         \
        -DCMAKE_BUILD_TYPE=Release
    make
}

package() {
    cd "$srcdir/$_gitname/build"
    make install DESTDIR="$pkgdir"
}
