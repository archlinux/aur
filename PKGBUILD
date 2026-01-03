pkgname=typomat
pkgver=0.1.3
pkgrel=1
pkgdesc="Turn your code into muscle memory"
arch=('any')
url="https://github.com/vupdivup/typomat"
license=('MIT')
depends=()
makedepends=('go>=1.25.4')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('SKIP')

build() {
    cd "$srcdir/$pkgname-$pkgver"

    export GOBIN="$srcdir/gobin"
    export GOPATH="$srcdir/gopath"

    go install ./cmd/$pkgname
}

package() {
    cd "$srcdir/$pkgname-$pkgver"

    install -Dm755 "$srcdir/gobin/$pkgname" "$pkgdir/usr/bin/$pkgname"
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
