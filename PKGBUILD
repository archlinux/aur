# Maintainer: wicast <wicastchen at hotmail dot com>
pkgname=picojson-git
pkgver=v1.3.0.r14.g13d3c0d
pkgrel=1
pkgdesc="a header-file-only, JSON parser serializer in C++"
arch=(any)
url="https://github.com/kazuho/picojson"
license=('BSD2')
source=(${pkgname%-git}::git+https://github.com/kazuho/picojson.git)
md5sums=(SKIP)

pkgver() {
    cd "${srcdir}/${pkgname%-git}"
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd "$srcdir/${pkgname%-git}"
    make
}

check() {
    cd "$srcdir/${pkgname%-git}"
    make -k check
}

package() {
    cd "$srcdir/${pkgname%-git}"
    make prefix="/usr" DESTDIR="$pkgdir/" install
}
