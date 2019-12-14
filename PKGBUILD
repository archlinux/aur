# Maintainer: Guillaume Horel <guillaume.horel@gmail.com>

pkgname=minizip-git
_pkgname=minizip
epoch=2
pkgver=2.3.3
pkgrel=1
arch=('x86_64')
license=('custom')
url="https://github.com/nmoinvaz/minizip"
depends=('glibc' 'libbsd' 'zlib')
makedepends=('git' 'cmake')
source=("git+https://github.com/nmoinvaz/minizip.git#commit=7bdfbf4"
    "soversion.patch"
    "project_name.patch"
    "pc.patch")
sha256sums=('SKIP'
            '3a648c48b9af7536e03c13327bd2f680a297fc629045fd904e344674971f3569'
            '3268ec716b89004bbc8124b3213c3bc0d15289d7771bbac82cd4c6694e390b79'
            'd45977c36a6c1b2eefbf39d829be8753cecd3d8910d1926ad842359da3b9a869')

prepare() {
    cd ${srcdir}/${_pkgname}
    patch -p1 < ../soversion.patch
    patch -p1 < ../project_name.patch
    patch -p1 < ../pc.patch
}

build() {
    cd ${srcdir}/${_pkgname}
    cmake -DCMAKE_INSTALL_PREFIX=/usr \
        -DBUILD_SHARED_LIBS=ON \
        -DCMAKE_BUILD_TYPE=Release .
    make
}

package() {
    cd ${_pkgname}
    make DESTDIR="${pkgdir}" install
}

