# Maintainer: Paul Spruce <paul.spruce@gmail.com>
pkgname=unfurl
pkgver=0.4.3
pkgrel=2
pkgdesc="Pull out bits of URLs provided on stdin"
arch=("x86_64")
url="https://github.com/tomnomnom/unfurl"
license=("MIT")
makedepends=("go")
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
b2sums=('SKIP')

prepare() {
    cd "$srcdir/$pkgname-$pkgver"
    mkdir -p build/
}

build() {
    cd "$srcdir/$pkgname-$pkgver"
    export GOPATH="$srcdir/gopath"
    export CGO_CPPFLAGS="$CPPFLAGS"
    export CGO_CFLAGS="$CFLAGS"
    export CGO_CXXFLAGS="$CXXFLAGS"
    export CGO_LDFLAGS="$LDFLAGS"
    export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
    go build -o build ./...
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    install -Dm755 build/$pkgname -t "$pkgdir/usr/bin/"
    install -Dm644 README.mkd "$pkgdir/usr/share/doc/$pkgname/README.md"
    install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
