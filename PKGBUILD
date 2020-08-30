# Maintainer: Pierre Mavro <pmavro@qovery.com>
pkgname=helm-freeze
pkgver=0.1
pkgrel=1
pkgdesc="Freeze your charts in the wished versions"
arch=(x86_64)
url="https://github.com/Qovery/helm-freeze"
license=('GPL')
makedepends=(git go)
source=("https://github.com/Qovery/helm-freeze/archive/v$pkgver.tar.gz")

build() {
	cd "$pkgname-$pkgver"
    export CGO_LDFLAGS="${LDFLAGS}"
    export CGO_CFLAGS="${CFLAGS}"
    export CGO_CPPFLAGS="${CPPFLAGS}"
    export CGO_CXXFLAGS="${CXXFLAGS}"
    export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"
    go build -o $pkgname main.go
}

package() {
	cd "$pkgname-$pkgver"
    install -Dm755 "$pkgname" "$pkgdir/usr/bin/helm-freeze"
    install -Dm644 LICENSE.md "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

md5sums=('1fdc5d143203311e94ea21de667e1211')
