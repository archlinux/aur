# Maintainer: boop <actually.boop@gmail.com>
pkgname=evhttpclient-git
_pkgname=evhttpclient
pkgver=r6.8acdd49
pkgrel=1
pkgdesc="An HTTP client in C++ that uses the libev event library."
arch=('x86_64' 'i686')
url="https://github.com/jspotter/evhttpclient"
license=('mixed')
depends=('libev')
source=("git+https://github.com/jspotter/evhttpclient.git"
        "evhttpclient-unistd.patch")
md5sums=('SKIP'
         '8bfd9d9082eb83c9569fe994ffec1a66')

pkgver() {
    cd "$_pkgname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    cd "$_pkgname"
    patch -p1 -i "$srcdir/evhttpclient-unistd.patch"
}

build() {
    cd "$_pkgname"
    make build
}

package() {
    cd "$_pkgname"

    install -Dm644 "evhttpclient.h" "$pkgdir/usr/include/evhttpclient.h"
    install -Dm644 "url.h" "$pkgdir/usr/include/url.h"
#    install -Dm644 "http_parser.h" "$pkgdir/usr/include/http_parser.h"
    install -sDm644 "libevhttpclient.so" "$pkgdir/usr/lib/libevhttpclient.so"
}
