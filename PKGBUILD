pkgname=simple-snake-on-go
pkgver=3.1.2
pkgrel=1
pkgdesc="High-performance terminal Snake game written in Go"
arch=('x86_64' 'aarch64')
url="https://github.com/XPLassal/simple-snake-on-go"
license=('MIT')
depends=('glibc')
makedepends=('go' 'git')
source=("git+https://github.com/XPLassal/simple-snake-on-go.git#tag=v$pkgver")
sha256sums=('SKIP')

build() {
    cd "$pkgname"
    export CGO_CPPFLAGS="${CPPFLAGS}"
    export CGO_CFLAGS="${CFLAGS}"
    export CGO_CXXFLAGS="${CXXFLAGS}"
    export CGO_LDFLAGS="${LDFLAGS}"
    export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"

    go build -ldflags "-s -w" -o simple-snake-on-go .
}

package() {
    cd "$pkgname"

    install -Dm755 simple-snake-on-go "$pkgdir/usr/bin/simple-snake-on-go"

    install -Dm644 simple-snake-on-go.desktop "$pkgdir/usr/share/applications/simple-snake-on-go.desktop"

    install -Dm644 simple-snake-on-go.png "$pkgdir/usr/share/pixmaps/simple-snake-on-go.png"

    if [ -f LICENSE ]; then
        install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    fi
}
