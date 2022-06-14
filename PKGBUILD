# Maintainer: Pierre Mavro <pmavro@qovery.com>
pkgname=helm-freeze
pkgver=0.5.0
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
}

md5sums=('ae1ca1c68fa2a5c9d7caba55c19bbe20')
