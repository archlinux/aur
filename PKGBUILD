# Maintainer: dashy9000
pkgname=stardom-card
pkgver=1.0.1
pkgrel=2
pkgdesc="CLI tool to scrape and display Stardom event cards"
arch=('x86_64')
url="https://github.com/dashy-jngl/StardomCardGo"
license=('MIT')
depends=('glibc')
makedepends=('go')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('1203f8e2e6a21873d51f5eaefc1a8826e03b28691799747539a30a2c8acdf636')

build() {
    cd "StardomCardGo-$pkgver"
    export CGO_CPPFLAGS="${CPPFLAGS}"
    export CGO_CFLAGS="${CFLAGS}"
    export CGO_CXXFLAGS="${CXXFLAGS}"
    export CGO_LDFLAGS="${LDFLAGS}"
    export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
    go build -o stardomcard .
}

package() {
    cd "StardomCardGo-$pkgver"
    install -Dm755 stardomcard "$pkgdir/usr/bin/stardomcard"
}
