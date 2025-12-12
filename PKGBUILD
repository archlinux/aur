pkgname=simple-go-snake
pkgver=4.1.1
pkgrel=1
pkgdesc="High-performance terminal Snake game written in Go"
arch=('x86_64' 'aarch64')
url="https://github.com/XPLassal/simple-go-snake"
license=('MIT')
depends=('glibc')
makedepends=('go' 'git')
source=("git+https://github.com/XPLassal/simple-go-snake.git#tag=v$pkgver")
sha256sums=('599208fc814cefb26e70f6da7ce4e631aed29d1a47937329d3acdd0e26f9cd34')
conflicts=('simple-snake-on-go')
provides=('simple-snake-on-go')

build() {
    cd "$pkgname"
    export CGO_CPPFLAGS="${CPPFLAGS}"
    export CGO_CFLAGS="${CFLAGS}"
    export CGO_CXXFLAGS="${CXXFLAGS}"
    export CGO_LDFLAGS="${LDFLAGS}"
    export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"

    go build -ldflags "-s -w" -o simple-go-snake .
}

package() {
    cd "$pkgname"
    install -Dm755 simple-go-snake "$pkgdir/usr/bin/simple-go-snake"

    install -Dm644 simple-go-snake.desktop "$pkgdir/usr/share/applications/simple-go-snake.desktop"
    install -Dm644 simple-go-snake.png "$pkgdir/usr/share/pixmaps/simple-go-snake.png"

    if [ -f LICENSE ]; then
        install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    fi
}
