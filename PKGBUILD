# Maintainer: Guillaume Horel <guillaume.horel@gmail.com>
pkgname='libdecaf'
pkgver='1.0.2'
pkgrel=1
pkgdesc="A 448-bit Edwards curve"
url="https://sourceforge.net/projects/ed448goldilocks/"
depends=('glibc')
makedepends=('cmake' 'git' 'python')
license=('MIT')
arch=('x86_64')
source=("libdecaf-1.0.2::git+git://git.code.sf.net/p/ed448goldilocks/code#commit=347057")
sha256sums=('SKIP')

build() {
    cmake -B build -S "${pkgname}-${pkgver}" \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=lib \
    -DENABLE_STATIC=OFF \
    -DENABLE_TESTS=ON \
    -DCMAKE_C_FLAGS="-Wno-sizeof-array-div -Wno-array-parameter"
    make -C build
}

package() {
    make DESTDIR="${pkgdir}" -C build install
    install -D -m644 "${pkgname}-${pkgver}/LICENSE.txt" "${pkgdir}/usr/share/licences/$pkgname/LICENSE.txt"
}

check() {
    make -C build test
}
