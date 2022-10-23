# Maintainer: Paul Spruce <paul.spruce@gmail.com>

pkgname=waybackurls
pkgver=0.1.0
pkgrel=2
pkgdesc="Fetch all the URLs that the Wayback Machine knows about for a domain"
arch=(any)
url="https://github.com/tomnomnom/waybackurls"
license=(MIT)
makedepends=(go)
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
b2sums=("a62730abe71d55d8082ea2beb34114cf5e6542dc4259b1f5bcc665a75e51663615158dbb5b5ddc35b14927875922687ccc429bc0cf9ae03ec136e7021698768b")

prepare() {
    cd $pkgname-$pkgver
    mkdir -p build/
}

build() {
    cd $pkgname-$pkgver
    export GOPATH="$srcdir/gopath"
    export CGO_CPPFLAGS="$CPPFLAGS"
    export CGO_CFLAGS="$CFLAGS"
    export CGO_CXXFLAGS="$CXXFLAGS"
    export CGO_LDFLAGS="$LDFLAGS"
    export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
    go build -o build ./...
}

package() {
    cd $pkgname-$pkgver
    install -Dm755 build/$pkgname -t "$pkgdir/usr/bin/"
    install -Dm644 README.mkd "$pkgdir/usr/share/doc/$pkgname/README.md"
}
