pkgname=anew
pkgver=0.1.1
pkgrel=1
pkgdesc="A tool for adding new lines to files, skipping duplicates"
arch=(any)
url="https://github.com/tomnomnom/anew"
license=(MIT)
makedepends=(go)
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
b2sums=("bf1cd8a709fb88d885da4c1a5753ae566fdef95ad176e84f2161d1f915956208118680805c6c1e0b369be39f726e10721ef8e615b43e739d7a8d3c29a2264a2c")

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
    install -Dm755 build/$pkgname "$pkgdir/usr/bin/$pkgname"
    install -Dm644 README.mkd "$pkgdir/usr/share/doc/$pkgname/README.md"
    install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
