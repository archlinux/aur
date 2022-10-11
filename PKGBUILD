# Maintainer: Paul Spruce <paul.spruce@gmail.com>
pkgname=meg
pkgver=0.3.0
pkgrel=1
pkgdesc="Fetch many paths for many hosts - without killing the hosts"
arch=("x86_64")
url="https://github.com/tomnomnom/meg"
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
    install -Dm755 build/$pkgname "$pkgdir/usr/bin/$pkgname"
    install -Dm644 README.mkd "$pkgdir/usr/share/doc/$pkgname/README.md"
    install -Dm644 CONTRIBUTING.mkd "$pkgdir/usr/share/doc/$pkgname/CONTRIBUTING.md"
    install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
