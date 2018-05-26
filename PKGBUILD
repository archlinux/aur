# Maintainer: KingofToasters <themanhimself at sgregoratto dot me>

pkgname=cointop
pkgver=1.0.5
pkgrel=1
pkgdesc="An interactive, real-time cryptocurrency monitor"
arch=('x86_64' 'i686')
url="https://github.com/miguelmota/cointop"
license=('APACHE')
makedepends=('go')
options=('!strip' '!emptydirs')
source=("$url/archive/$pkgver.tar.gz")
sha256sums=('2c780c3fe7fa7dd0d51ad0f0d1b1b7b7ee3f8365b9605ab73f21557e72077d78')

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
