# Maintainer: Brad Erhart <brae.04+aur@gmail.com>

pkgname=flarectl
_pkgname=cloudflare-go
pkgver=0.11.0
pkgrel=1
pkgdesc='CLI application for interacting with a Cloudflare account'
arch=('x86_64')
url="https://github.com/cloudflare/cloudflare-go/tree/v${pkgver}/cmd/flarectl"
license=('BSD')
makedepends=('go-pie')
source=("$_pkgname-$pkgver.tar.gz::https://github.com/cloudflare/$_pkgname/archive/v$pkgver.tar.gz")
sha256sums=('e643fe3be72955738a1adef0dc4ae1b902d792857e53f20e03d5f66968b39bb1')

build() {
	cd "$_pkgname-$pkgver/cmd/$pkgname"
	go build \
		-trimpath \
		-ldflags "-extldflags $LDFLAGS"
}

package() {
	install -Dm755 "$_pkgname-$pkgver/cmd/$pkgname/$pkgname" "$pkgdir/usr/bin/$pkgname"
}
