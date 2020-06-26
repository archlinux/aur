# Maintainer: Pierre Mavro <deimosfr@gmail.com>
pkgname=jeedom-status
pkgver=0.8.0
pkgrel=1
pkgdesc="Add Jeedom global status to your favorite desktop bar (i3blocks, polybar, etc...)"
arch=(x86_64)
url="https://github.com/deimosfr/jeedom-status"
license=('GPL')
makedepends=(git go)
source=("https://github.com/deimosfr/jeedom-status/archive/v$pkgver.tar.gz")

build() {
	cd "$pkgname-$pkgver"
    export CGO_LDFLAGS="${LDFLAGS}"
    export CGO_CFLAGS="${CFLAGS}"
    export CGO_CPPFLAGS="${CPPFLAGS}"
    export CGO_CXXFLAGS="${CXXFLAGS}"
    export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"
    go build -o jeedom-status main.go
}

package() {
	cd "$pkgname-$pkgver"
    install -Dm755 "$pkgname" "$pkgdir/usr/bin/$pkgname"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
md5sums=('1f6e2f17cc5639c813a1d989cc9951f6')
