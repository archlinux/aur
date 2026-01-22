# Maintainer: Adrià Arrufat <swiftscythe at gmail dot com>

_pkgname=zignal
pkgname=$_pkgname-git
pkgrel=1
pkgver=0.10.0+dev.71+0187f66
pkgdesc="CLI to zignal, a zero-dependency image processing library"
arch=(x86_64 aarch64 i686)
url="http://github.com/bfactory-ai/$_pkgname"
license=(MIT)
depends=()
makedepends=(git zig)
source=("git+${url}.git")
sha256sums=('SKIP')
provides=("$_pkgname")
conflicts=("$_pkgname")

pkgver() {
    cd "$_pkgname"
    zig build version | sed 's/-/+/g'
}

check() {
    cd "$_pkgname"
    zig build test
}

build() {
    cd "$_pkgname"
    zig build --release=fast
}

package() {
    cd "$_pkgname"
    install -D zig-out/bin/zignal $pkgdir/usr/bin/zignal
    install -D LICENSE $pkgdir/usr/share/licenses/zignal-git/LICENSE
}
