# Maintainer: Paul Spruce <paul.spruce@gmail.com>

pkgname=unfurl
pkgver=0.4.3
pkgrel=2
pkgdesc="Pull out bits of URLs provided on stdin"
arch=(any)
url="https://github.com/tomnomnom/unfurl"
license=(MIT)
makedepends=(go)
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
b2sums=("b197201988248d8aea3d92aee2158b7b7a99101d2a66a2e2892c47753aac51b9909c63f0b674dc4ed5fcccb29e61746529e38b1fae2983e38a3471fb2acf3962")

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
    install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
