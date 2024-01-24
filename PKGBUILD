# Maintainer: suliman altassan <suliman.p2019@gmail.com>
# Contributor: Fabio 'Lolix' Loli <fabio.loli@disroot.org>

pkgname=webui
pkgver=2a5f0c9
pkgrel=1
pkgdesc="Use any web browser as GUI, with your preferred language in the backend and HTML5 in the frontend, all in a lightweight portable lib."
arch=('x86_64')
url="https://webui.me/"
license=('MIT')
depends=("openssl" "glibc")
makedepends=("git" "zig")
_commit=2a5f0c9
source=("git+https://github.com/webui-dev/webui.git#commit=${_commit}")
md5sums=('SKIP')

build() {
    cd "$srcdir/$pkgname"
    zig build -Dis_static=false -Denable_tls=true
    zig build -Dis_static=true -Denable_tls=true
}

package() {
    cd "$srcdir/$pkgname"
    # install header file
    install -Dm644 "include/webui.h" "$pkgdir/usr/include/webui.h"
    install -Dm644 "include/webui.hpp" "$pkgdir/usr/include/webui.hpp"
    # install library
    install -Dm644 "zig-out/lib/libwebui.a" "$pkgdir/usr/lib/libwebui.a"
    install -Dm755 "zig-out/lib/libwebui.so" "$pkgdir/usr/lib/libwebui.so"
    # install license file
    install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
