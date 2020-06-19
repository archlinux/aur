# Maintainer: Brad Erhart <brae.04+aur@gmail.com>

pkgname=flarectl
_pkgname=cloudflare-go
pkgver=0.12.0
pkgrel=1
pkgdesc='CLI application for interacting with a Cloudflare account'
arch=('x86_64')
url="https://github.com/cloudflare/cloudflare-go/tree/v${pkgver}/cmd/flarectl"
license=('BSD')
makedepends=('go-pie')
source=("$_pkgname-$pkgver.tar.gz::https://github.com/cloudflare/$_pkgname/archive/v$pkgver.tar.gz")
sha256sums=(66b2768674b248ea46c6775c5f8f55916459583937606727677a4c7690348f07)

build() {
	cd "$_pkgname-$pkgver/cmd/$pkgname"
	go build \
		-trimpath \
		-ldflags "-extldflags $LDFLAGS"
}

package() {
	install -Dm 755 "$_pkgname-$pkgver/cmd/$pkgname/$pkgname" "$pkgdir/usr/bin/$pkgname"
}
