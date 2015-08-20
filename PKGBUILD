pkgname="lib_mysqludf_sys"
pkgver=1.87fda59
pkgrel=1
pkgdesc="User-defined functions for interacting with OS from MySQL"
url="https://github.com/mysqludf/lib_mysqludf_sys"
arch=('any')
license=('GPL')
makedepends=()
source=(git+https://github.com/mysqludf/lib_mysqludf_sys)
md5sums=(SKIP)

pkgver() {
    cd "${pkgname}"
    echo $(git rev-list --count master).$(git rev-parse --short master)
}

build() {
    cd "$srcdir/$pkgname"

    sed -re s/gcc/gcc\ -fPIC/ -i Makefile

    make LIBDIR=.
}

package() {
    install -Dm644 "$srcdir/$pkgname/lib_mysqludf_sys.so" "${pkgdir}/usr/bin/lib_mysqludf_sys.so"
}
