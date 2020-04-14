# Maintainer: Cody Schafer <dev@codyps.com>

pkgname=grpcurl
pkgver=1.5.1
pkgrel=1
pkgdesc="Like cURL, but for gRPC: Command-line tool for interacting with gRPC servers"
arch=(x86_64)
url="https://github.com/fullstorydev/grpcurl"
license=('MIT')
makedepends=('go-pie')
source=("$pkgname-$pkgver.tar.gz::https://github.com/fullstorydev/grpcurl/archive/v$pkgver.tar.gz")
md5sums=('2be962886db190fd11b5f4492ac979d9')
# really, `grpcurl-bin` should be conflicting with us instead of the oposite
conflicts=('grpcurl-bin')

build() {
	cd "$pkgname-$pkgver"
	go build \
		-trimpath \
		-ldflags "-extldflags ${LDFLAGS}" \
		./cmd/grpcurl
}

package() {
	cd "$pkgname-$pkgver"
	install -Dm755 grpcurl "${pkgdir}/usr/bin/grpcurl"
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
