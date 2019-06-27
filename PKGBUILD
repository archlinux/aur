# Maintainer: hexchain <i at hexchain dot org>

pkgname=dellfan-git
_repo=dellfan
url="https://github.com/clopez/dellfan"
pkgver=r2.fe2ec69
pkgrel=1
arch=('x86_64')
pkgdesc="User space utility to control the fan speed on Dell Laptops"
license=('GPL2')
depends=('glibc')
source=("git+https://github.com/clopez/dellfan.git")

pkgver() {
    cd "$_repo"
    ( set -o pipefail; git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
        printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)";
    )
}

build() {
    cd "$srcdir/$_repo"
    make
}

package() {
    cd "$srcdir/$_repo"
    install -Dm755 dellfan "$pkgdir/usr/bin/dellfan"
}
sha256sums=('SKIP')
