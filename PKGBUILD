# Maintainer: Luis Martinez <luis dot martinez at tuta dot io>
# Contributor: Thiago Almeida <echo "dGhpYWdvYWxtZWlkYXNhQGdtYWlsLmNvbQo=" | base64 -d>

pkgname=cloud-nuke
pkgver=0.3.0
pkgrel=1
pkgdesc="An AWS account cleaning tool"
url="https://github.com/gruntwork-io/cloud-nuke"
arch=('x86_64' 'i686' 'aarch64')
license=('MIT')
depends=('glibc')
makedepends=('go')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('6a7e3d2ed1672eff9938ed4e943e2f82244a2582996d91f91f89c9f1acdac982')

build() {
	export CGO_CPPFLAGS="${CPPFLAGS}"
	export CGO_CFLAGS="${CFLAGS}"
	export CGO_CXXFLAGS="${CXXFLAGS}"
	export CGO_LDFLAGS="${LDFLAGS}"
	export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"

	cd "$pkgname-$pkgver"
	go build
}

# check() {
# 	export CGO_CPPFLAGS="${CPPFLAGS}"
# 	export CGO_CFLAGS="${CFLAGS}"
# 	export CGO_CXXFLAGS="${CXXFLAGS}"
# 	export CGO_LDFLAGS="${LDFLAGS}"
# 	export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
#
# 	cd "$pkgname-$pkgver"
# 	go test -v ./...
# }

package() {
	cd "$pkgname-$pkgver"
	install -Dm755 cloud-nuke -t "$pkgdir/usr/bin/"
	install -Dm644 LICENSE.txt -t "$pkgdir/usr/share/licenses/$pkgname/"
	install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
