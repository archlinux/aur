# Maintainer: Ben Goldberg <jediben97@gmail.com>

pkgname=slic3r-server
pkgver=0.1.0_alpha
pkgrel=1
pkgdesc="A small program to control the slicing program Slic3r with a RESTful API"
arch=('i686' 'x86_64')
url="https://github.com/zethra/slic3rServer"
license=('MIT')
depends=('slic3r')
makedepends=('git' 'go')
source=("https://github.com/zethra/slic3rServer/archive/v${pkgver//_/-}.tar.gz")
sha256sums=('5964c9c9a58288b6864df367a0b2d6dbb87ad430fa7974ddf9ebae9ea71a1a64')

build() {
    mkdir -p bin pkg src/github.com/zethra/
    cp -r $pkgname-${pkgver//_/-} src/github.com/zethra/slic3rServer
    export GOPATH=$srcdir
    go get github.com/gorilla/mux
    go build -o bin/slic3rServer github.com/zethra/slic3rServer
}

check() {
    go test github.com/zethra/slic3rServer
}

package() {
    mkdir -p $pkgdir/usr/share/slic3rServer
    mkdir -p $pkgdir/usr/bin/
    cp bin/slic3rServer $pkgdir/usr/share/slic3rServer/
    ln -s $pkgdir/usr/share/slic3rServer/slic3rServer $pkgdir/usr/bin/slic3rServer
}
