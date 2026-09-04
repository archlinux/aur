# Maintainer: Ketchup901 <ketchup901@riseup.net>

pkgname=updfparser-git
pkgver=r33.6060d12344
pkgrel=1
pkgdesc="Very simple PDF parser"
arch=('any')
url="https://forge.soutade.fr/soutade/uPDFParser"
license=('LGPL-3.0-or-later')
provides=('updfparser')
conflicts=('updfparser')
makedepends=('git')
depends=(
    'libgcc'
    'glibc'
    'libstdc++'    
)
source=("git+${url}.git")
sha256sums=('SKIP')

_srcdir="uPDFParser"

pkgver() {
    cd $_srcdir
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=10 HEAD)"
}

build() {
    cd $_srcdir
    export CXXFLAGS+=" -std=c++17"
    make BUILD_STATIC=0 BUILD_SHARED=1
}

package() {
    install -Dm644 $_srcdir/include/*.h -t $pkgdir/usr/include/
    install -Dm644 $_srcdir/libupdfparser.so -t $pkgdir/usr/lib/
}

