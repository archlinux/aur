# vim:set ft=sh:
# Maintainer: BlackEagle < ike DOT devolder AT gmail DOT com >
pkgname=par2cmdline-git
_gitname='par2cmdline'
pkgver=20261011.a6d3423
pkgrel=1
pkgdesc="A file verification and repair tool"
url="https://github.com/BlackIkeEagle/par2cmdline"
license=("GPL")
makedepends=('git' 'tar' 'cmake' 'ninja')
depends=('gcc-libs')
arch=('x86_64')
provides=('par2cmdline')
conflicts=('par2cmdline')
source=("$_gitname::git+https://github.com/BlackIkeEagle/par2cmdline.git")
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir/$_gitname"
    git log -1 --date=short --format="%cd.%h" | tr -d '-'
}

build() {
    cmake \
        -S ${_gitname} \
        -B build \
        -G Ninja \
        -DCMAKE_BUILD_TYPE=Release \
        -DPAR2_KEEP_ASSERTS=ON
    cmake --build build
}

check() {
    ctest --test-dir build
}

package() {
    DESTDIR=$pkgdir cmake \
        --install build \
        --prefix /usr
}
