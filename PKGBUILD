# Maintainer: dashy9000
pkgname=stardom-card
pkgver=1.0.2
pkgrel=1
pkgdesc="CLI tool to scrape and display Stardom event cards"
arch=('x86_64')
url="https://github.com/dashy-jngl/StardomCardGo"
license=('MIT')
depends=('glibc')
makedepends=('go')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('cadbd5fa22ba390da879eda4ee8da2e951a8742dd5923ab1713449797ed1757d')

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
