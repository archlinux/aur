# Maintainer: KingofToasters <themanhimself at sgregoratto dot me>

pkgname=cointop
pkgver=1.0.6
pkgrel=1
pkgdesc="An interactive, real-time cryptocurrency monitor"
arch=('x86_64' 'i686')
url="https://github.com/miguelmota/cointop"
license=('APACHE')
makedepends=('go')
options=('!strip' '!emptydirs')
source=("$url/archive/$pkgver.tar.gz")
sha256sums=('6188f21e7fcdfe686324a30a5ccc89a684e2a9acd81f2b042309ec0b28c26272')

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
