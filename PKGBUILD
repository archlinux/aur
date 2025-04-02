# Maintainer: Ralph Torres <mail at ralphptorr dot es>

pkgname=sptlrx
pkgver=1.2.3
pkgrel=1
pkgdesc='Synchronized lyrics in your terminal'
arch=(x86_64)
url=https://github.com/raitonoberu/sptlrx
license=(MIT)

makedepends=(go)
source=($pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz)
sha256sums=(19f704a9eb1ce689912ac342794f028bbc8dc04ecfb5edd64017ee1c46d54e94)

build () {
    cd "$srcdir"/$pkgname-$pkgver
    export CGO_CFLAGS="$CFLAGS"
    export CGO_CPPFLAGS="$CPPFLAGS"
    export CGO_CXXFLAGS="$CXXFLAGS"
    export CGO_LDFLAGS="$LDFLAGS"
    export GOFLAGS='-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw'
    go build .
}

check() {
    cd "$srcdir"/$pkgname-$pkgver
    go test ./...
}

package() {
    cd "$srcdir"/$pkgname-$pkgver
    install -Dm755 -t "$pkgdir"/usr/bin $pkgname
    install -Dm644 -t "$pkgdir"/usr/share/licenses/$pkgname LICENSE
    install -Dm644 -t "$pkgdir"/usr/share/doc/$pkgname README.md
    install -Dm644 -t "$pkgdir"/usr/share/man/man5 man/$pkgname.5
}
