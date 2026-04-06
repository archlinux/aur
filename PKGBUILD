# Maintainer: Ralph Torres <mail at ralphptorr dot es>

pkgname=sptlrx
pkgver=1.3.1
pkgrel=1
pkgdesc='Synchronized lyrics in your terminal'
arch=(x86_64)
url=https://github.com/raitonoberu/sptlrx
license=(MIT)

makedepends=(go)
source=($pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz)
sha256sums=('94e586a75a089c134e75923126cba35d8d304e3ef384d65b669dd40fe3187f4d')

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
