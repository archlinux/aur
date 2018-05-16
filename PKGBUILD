# Maintainer: Vincent Bernardoff <vb AT luminar.eu.org>
pkgname=nng-git
pkgver=0.9.0.35.g84c32ea
pkgrel=1
pkgdesc="Rewrite of the SP protocol library known as libnanomsg"
arch=(armv6 armv6h aarch64 x86_64 i686)
url="https://nanomsg.github.io/nng/"
license=('MIT')
depends=()
makedepends=('git' 'cmake' 'ninja')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
install=
source=('git+https://github.com/nanomsg/nng.git')
noextract=()
md5sums=('SKIP')

pkgver() {
    cd "$srcdir/${pkgname%-git}"
    git describe --always --dirty --tags | sed -e 's/-/./g'
}

prepare() {
    cd "$srcdir/${pkgname%-git}/build"
    cmake -G Ninja ..
}

build() {
    cd "$srcdir/${pkgname%-git}/build"
    ninja
}

check() {
    cd "$srcdir/${pkgname%-git}/build"
    ninja test
}

package() {
    cd "$srcdir/${pkgname%-git}"
    install -d "$pkgdir/usr/lib"
    install -d "$pkgdir/usr/include/${pkgname%-git}"
    cp build/libnng* "$pkgdir/usr/lib"
    install -Dm644 "src/${pkgname%-git}.h" "$pkgdir/usr/include/${pkgname%-git}/${pkgname%-git}.h"
    install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE.txt"
}
