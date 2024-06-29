# Maintainer: jinzhongjia <mail@nvimer.org>

pkgname=webui-nossl
_pkgname=webui
pkgver=2.5.0+beta.1+14+gb65608df
pkgrel=2
pkgdesc="Use any web browser as GUI, with your preferred language in the backend and HTML5 in the frontend, all in a lightweight portable lib.(without ssl support)"
arch=('x86_64')
url="https://webui.me/"
license=('MIT')
depends=("glibc")
conflicts=('webui')
makedepends=("git" "make" "gcc")
provides=("webui")
conflicts=("webui")
_commit=b65608dfec1c4cb44e4f77a4724995f54cb99386
source=("git+https://github.com/webui-dev/webui.git#commit=${_commit}")
md5sums=('SKIP')

pkgver() {
    cd "$_pkgname"
    git describe --tags --exclude nightly | sed 's/^v//;s/-/+/g'
}

build() {
    cd "$srcdir/$_pkgname"
    make
    mv "dist/libwebui-2-static.a" "dist/libwebui.a"
    mv "dist/webui-2.so" "dist/libwebui.so"
}

package() {
    cd "$srcdir/$_pkgname"
    # install header file
    install -Dm644 "include/webui.h" "$pkgdir/usr/include/webui.h"
    install -Dm644 "include/webui.hpp" "$pkgdir/usr/include/webui.hpp"
    # install library
    install -Dm644 "dist/libwebui.a" "$pkgdir/usr/lib/libwebui.a"
    install -Dm755 "dist/libwebui.so" "$pkgdir/usr/lib/libwebui.so"
    # install license file
    install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
