# shellcheck disable=SC2034,SC2154,SC2164
# Maintainer: javalsai <javalsai@proton.me>
pkgname=osc-theimpostor-git
pkgver=0.4.8.r1.g954461a
pkgrel=1
depends=()
makedepends=('go')
pkgdesc="Access the system clipboard from anywhere using the ANSI OSC52 sequence"
arch=('any')
url="https://github.com/theimpostor/osc"
license=('MIT')
source=("osc::git+$url")
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir/osc"
    git describe --long --abbrev=7 --tags | \
        sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd "$srcdir/osc"
    go build
}

package() {
    cd "$srcdir/osc"
    install -Dm755 osc "$pkgdir/usr/bin/osc"
}
