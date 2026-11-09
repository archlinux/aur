# Maintainer: let <let@notlet.dev>

pkgname=img2stl
pkgver=c24da96
pkgrel=1
pkgdesc='Turns a two-color image into a 3D-print ready STL file'
arch=('any')
url='https://github.com/notlet/img2stl'
license=('LGPL3')
makedepends=('go' 'git')
source=('git+https://github.com/notlet/img2stl.git')
sha256sums=('SKIP')
options=('!debug')

build() {
    cd "$srcdir/img2stl"

    go build -ldflags "-X main.COMMIT=$(git rev-parse --short HEAD)" -o dist/$pkgname img2stl.go 
}

package() {
    install -Dm755 "$srcdir/img2stl/dist/$pkgname" "$pkgdir/usr/bin/$pkgname"
}

pkgver() {
    cd "$srcdir/img2stl"
    git describe --always
}
