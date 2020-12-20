# Maintainer: Guillaume Horel <guillaume.horel@gmail.com>
pkgname='libdecaf'
pkgver='1.0.1'
pkgrel=2
pkgdesc="A 448-bit Edwards curve"
url="https://sourceforge.net/projects/ed448goldilocks/"
depends=('glibc')
makedepends=('cmake' 'git' 'python')
license=('MIT')
arch=('x86_64')
source=("libdecaf-1.0.1::git+git://git.code.sf.net/p/ed448goldilocks/code#commit=aa9c5c")
sha256sums=('SKIP')

build() {
    cmake -B build "${pkgname}-${pkgver}" \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=lib \
    -DENABLE_STATIC=OFF \
    -DENABLE_TESTS=ON ..
    make -C build
}

package() {
    make DESTDIR="${pkgdir}" -C build install
}

check() {
    make -C build test
}
