#Maintainer: Karl Wikström <boogrocha@sidus.io>
#Maintainer: William Leven <boogrocha@sidus.io>

pkgname=boogrocha
pkgver=r74.11495d3
pkgrel=1
pkgdesc="A lightweight, easy to use application for managing your group room bookings at Chalmers University of Technology"
arch=('x86_64')
conflicts=(bgc)
provides=(bgc)
url="https://github.com/sidusio/boogrocha"
license=("GPL3")
makedepends=(git go)
source=($pkgname::git+$url.git#tag=1.0.2)
sha256sums=('SKIP')

pkgver() {
    cd $srcdir/$pkgname
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd $pkgname/cmd/bgc
    go build
}

package() {
    cd $pkgname/cmd/bgc
    install -Dm755 bgc "$pkgdir"/usr/bin/bgc
}
