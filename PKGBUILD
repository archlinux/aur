# Maintainer: KingofToasters <themanhimself at sgregoratto dot me>
pkgname=goawk
pkgver=1.1.5
pkgrel=1
pkgdesc="AWK interpreter written in go"
url="https://github.com/benhoyt/goawk"
license=('MIT')
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
makedepends=('go-pie')
source=("$url/archive/v$pkgver.tar.gz")
sha256sums=('56ff6e0f72b5481431e65d4a46ed39f1bae26e52126532e23f8d9333ac42454e')

build() {
	cd "${pkgname}-${pkgver}"
	go build \
		-gcflags "all=-trimpath=${PWD}" \
		-asmflags "all=-trimpath=${PWD}" \
		-ldflags "-extldflags ${LDFLAGS}" \
		-o "${pkgname}" .
}

check() {
	cd "${pkgname}-${pkgver}"
	go test ./...
}

package() {
	install -Dm755 "${pkgname}-${pkgver}/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
	install -Dm644 "${pkgname}-${pkgver}/LICENSE.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENCE"
}
