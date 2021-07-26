# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Thiago Almeida <echo "dGhpYWdvYWxtZWlkYXNhQGdtYWlsLmNvbQo=" | base64 -d>

pkgname=cloud-nuke
pkgver=0.4.0
pkgrel=1
pkgdesc="An AWS account cleaning tool"
url="https://github.com/gruntwork-io/cloud-nuke"
arch=('x86_64' 'i686' 'aarch64')
license=('MIT')
depends=('glibc')
makedepends=('go')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('18cc93a7245420ed86dedf5a604afea238e6bde953ea4e938b0c43939c59c5ab')

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
