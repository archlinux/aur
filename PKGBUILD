# Maintainer: Jaco Malan <jacomalan.12@gmail.com>
pkgname=libclstl-git
pkgrel=1
pkgver=r2.a623908
pkgdesc="The CodeLog Standard Template Library"
provides=('libclstl')
conflicts=('libclstl')
arch=('any')
url="https://github.com/Code-Log/clstl"
license=('MIT')
makedepends=('clang' 'git' 'cmake')
source=('libclstl::git+https://github.com/Code-Log/clstl#branch=master')

pkgver() {

    cd $srcdir
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"

}

prepare() {
    mkdir -p $srcdir/libclstl/build
}

build() {

    cd $srcdir/libclstl/build
    cmake .. -DCMAKE_BUILD_TYPE=Release -DCMAKE_C_COMPILER=$(which clang) -DCMAKE_CXX_COMPILER=$(which clang++)
    make $MAKEFLAGS

}

package() {

    cd $srcdir/libclstl/build
    make DESTDIR="$pkgdir" install

}
md5sums=('SKIP')
