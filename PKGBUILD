# Maintainer: imjiaoyuan <imjiaoyuan@gmail.com>

pkgname=ctty
pkgver=1.4.1
pkgrel=1
pkgdesc="Lightweight all-in-one TUI connection manager for SSH, serial, SFTP, telnet and FTP"
arch=('x86_64')
url="https://github.com/zsuroy/ctty"
license=('MIT')
makedepends=('go')
conflicts=('ctty-bin')
options=('!strip' '!debug')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('0cda49232b3f0487959bbd234d810b1807d010348037ba75ea1030746f2d3fbe')

build() {
    cd "$srcdir/ctty-$pkgver"
    export CGO_ENABLED=0
    export GOPATH="$srcdir/gopath"
    export GOCACHE="$srcdir/gocache"
    export GOFLAGS="-mod=readonly -buildvcs=false"
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
