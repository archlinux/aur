# Maintainer: KingofToasters <themanhimself at sgregoratto dot me>

pkgname=cointop
pkgver=1.0.1
pkgrel=1
pkgdesc="An interactive, real-time cryptocurrency monitor"
arch=('x86_64' 'i686')
url="https://github.com/miguelmota/cointop"
license=('APACHE')
makedepends=('go')
options=('!strip' '!emptydirs')
source=("$url/archive/$pkgver.tar.gz")
sha256sums=('bb5450c734a2d0c54a1dc7d7f42be85eb2163c03e6d3dc1782d74b54a8cbfa69')

prepare() {
    cd "$pkgname-$pkgver"

    GOPATH="$(pwd)" go get -d -v
}

build(){
    cd "$pkgname-$pkgver"

    GOPATH="$(pwd)" go build -ldflags "-s -w"
}

package() {
    cd "$pkgname-$pkgver"

    install -Dm755 "$pkgname-$pkgver" "$pkgdir/usr/bin/$pkgname"
    install -Dm644 "LICENSE.md" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
