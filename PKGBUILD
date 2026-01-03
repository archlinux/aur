pkgname=typomat
pkgver=0.1.3.r0.g2baf227
pkgrel=1
pkgdesc="Turn your code into muscle memory"
arch=('any')
url="https://github.com/vupdivup/typomat"
license=('MIT')
depends=()
makedepends=('git' 'go>=1.25.4')
source=(git+"$url")
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir/$pkgname"

    git describe --tags --long | \
        sed 's/^v//;s/-/.r/;s/-/./'
}

build() {
    cd "$srcdir/$pkgname"

    export GOBIN="$srcdir/gobin"
    export GOPATH="$srcdir/gopath"

    go install ./cmd/$pkgname
}

package() {
    cd "$srcdir/$pkgname"

    install -Dm755 "$srcdir/gobin/$pkgname" "$pkgdir/usr/bin/$pkgname"
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
