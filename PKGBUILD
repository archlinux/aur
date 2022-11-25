# Maintainer: Emad Elsaid <emad.elsaid.hamed@gmail.com>
pkgname=xlog-git
_pkgname="xlog"
pkgver=0.41.0.r5.gf79e299
pkgrel=1
pkgdesc="Xlog is a static site generator for digital gardening written in Go"
arch=('i686' 'pentium4' 'x86_64' 'arm' 'armv6h' 'armv7h' 'aarch64')
url="https://github.com/emad-elsaid/xlog"
license=('MIT')
depends=('git')
makedepends=('go>=1.19')
provides=('xlog')
conflicts=('xlog')
source=(xlog::git+https://github.com/emad-elsaid/xlog.git#branch=master)
sha256sums=("SKIP")

pkgver() {
    cd "$srcdir/$_pkgname"
    git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    export GOPATH="$srcdir"/gopath
    cd "$srcdir/$_pkgname"
    go build -o xlog ./cmd/xlog
}

package() {
    cd "$srcdir/$_pkgname"
    install -Dm755 xlog $pkgdir/usr/bin/xlog
}
