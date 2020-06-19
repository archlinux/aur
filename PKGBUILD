# Maintainer: Thorben Günther <echo YWRtaW5AeGVucm94Lm5ldAo= | base64 -d>

pkgname=chronic
pkgver=1.0.11
pkgrel=1
pkgdesc='Filters out standard output for cron emails.'
arch=('x86_64')
url='https://github.com/docwhat/chronic'
license=('MIT')
makedepends=('go')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('9e0a50086f15d32c68cdafa22919f088813b64bd4890e667a7c08ed7ba7dce1c')

build() {
    cd "$srcdir/$pkgname-$pkgver"
    export CGO_LDFLAGS="${LDFLAGS}"
    export CGO_CFLAGS="${CFLAGS}"
    export CGO_CPPFLAGS="${CPPFLAGS}"
    export CGO_CXXFLAGS="${CXXFLAGS}"
    export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"
    go build -o chronic
}

package() {
    cd "$srcdir/$pkgname-$pkgver"

    install -Dm755 chronic "$pkgdir/usr/bin/chronic"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
