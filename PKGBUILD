# Maintainer: imjiaoyuan <imjiaoyuan@gmail.com>

pkgname=ctty
pkgver=0.8.0
pkgrel=1
pkgdesc="Lightweight all-in-one TUI connection manager for SSH, serial, SFTP, telnet and FTP"
arch=('x86_64')
url="https://github.com/zsuroy/ctty"
license=('MIT')
makedepends=('go')
conflicts=('ctty-bin')
options=('!strip' '!debug')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('d4921c4cfe9af554ffafdfd5e2c36da14fdbe44ee5ee8578cca4397329adf053')

build() {
    cd "$srcdir/ctty-$pkgver"
    export CGO_ENABLED=0
    export GOPATH="$srcdir/gopath"
    export GOCACHE="$srcdir/gocache"
    export GOFLAGS=-mod=readonly
    export GOPROXY="https://proxy.golang.org"
    go build -trimpath \
        -ldflags "-s -w -X github.com/zsuroy/ctty/cmd.AppVersion=$pkgver" \
        -o "$srcdir/$pkgname" .
}

package() {
    install -Dm755 "$srcdir/$pkgname" "$pkgdir/usr/bin/$pkgname"
    install -Dm644 "$srcdir/ctty-$pkgver/LICENSE" \
        "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
