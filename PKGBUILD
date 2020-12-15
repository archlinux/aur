# Maintainer: Pierre Mavro <pmavro@qovery.com>
pkgname=qovery-cli
pkgver=0.33.2
pkgrel=1
pkgdesc="Qovery Command Line Interface"
arch=(x86_64)
url="https://github.com/Qovery/qovery-cli"
license=('GPL')
makedepends=(git go)
source=("https://github.com/Qovery/qovery-cli/archive/v$pkgver.tar.gz")

build() {
	cd "$pkgname-$pkgver"
    export CGO_CFLAGS="${CFLAGS}"
    export CGO_CPPFLAGS="${CPPFLAGS}"
    export CGO_CXXFLAGS="${CXXFLAGS}"
    export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"
    go build -o $pkgname qovery.go
}

package() {
	cd "$pkgname-$pkgver"
    install -Dm755 "$pkgname" "$pkgdir/usr/bin/qovery"
    install -Dm644 LICENSE.md "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
md5sums=('baa48e32c8763a9df9824fe02f1d956a')
