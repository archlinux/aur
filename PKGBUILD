# Maintainer: Ralph Torres <mail at ralphptorr dot es>

pkgname=maildir-rank-addr
pkgver=1.3.0
pkgrel=1
pkgdesc='Generates a ranked addressbook from a maildir folder'
arch=(x86_64)
url=https://github.com/ferdinandyb/maildir-rank-addr
license=(MIT)

provides=($pkgname)
conflicts=($pkgname)
makedepends=(go)
source=($pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz)
sha256sums=(f28398765dd91aa4d0775fd1f7022dae5550c90919a2d84ba1d7d81370af283c)

build () {
    cd "$srcdir"/$pkgname-$pkgver
    export CGO_CFLAGS="$CFLAGS"
    export CGO_CPPFLAGS="$CPPFLAGS"
    export CGO_CXXFLAGS="$CXXFLAGS"
    export CGO_LDFLAGS="$LDFLAGS"
    export GOFLAGS='-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw'
    go build .
}

package() {
    cd "$srcdir"/$pkgname-$pkgver
    install -Dm755 -t "$pkgdir"/usr/bin $pkgname
    install -Dm644 -t "$pkgdir"/usr/share/licenses/$pkgname LICENSE
    install -Dm644 -t "$pkgdir"/usr/share/doc/$pkgname README.md
}
