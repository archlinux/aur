pkgname=simple-go-snake
pkgver=4.3.0
pkgrel=1
pkgdesc="High-performance terminal Snake game written in Go"
arch=('x86_64' 'aarch64')
url="https://github.com/XPLassal/simple-go-snake"
license=('MIT')
depends=('glibc')
makedepends=('go' 'git')
source=("git+https://github.com/XPLassal/simple-go-snake.git#tag=v$pkgver")
sha256sums=('a004fb3102f960745c78ec3ceb3d47f3b70c6edc0d2708b11ae90b3e3246443c')
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
