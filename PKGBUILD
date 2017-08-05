# Maintainer: Ben Goldberg <jediben97@gmail.com>

pkgname=slic3r-server
pkgver=0.1.1
pkgrel=2
pkgdesc="A small program to control the slicing program Slic3r with a RESTful API"
arch=('i686' 'x86_64')
url="https://github.com/zethra/slic3rServer"
license=('MIT')
depends=('slic3r')
makedepends=('git' 'go')
source=("https://github.com/zethra/slic3rServer/archive/v$pkgver.tar.gz")
sha256sums=('2bc8e24a06cbb60f981cc8cb70e6aabd57b73f3b27fb76dcf0d9711411e4362c')

build() {
    mkdir -p bin pkg src/github.com/zethra/
    cp -r slic3rServer-$pkgver src/github.com/zethra/slic3rServer
    export GOPATH=$srcdir
    go get github.com/gorilla/mux
    go build -o bin/slic3rServer github.com/zethra/slic3rServer
}

package() {
    mkdir -p $pkgdir/usr/share/slic3rServer
    mkdir -p $pkgdir/usr/bin/
    cp bin/slic3rServer $pkgdir/usr/share/slic3rServer/
    ln -s /usr/share/slic3rServer/slic3rServer $pkgdir/usr/bin/slic3rServer
}
