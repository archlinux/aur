# Maintainer: KingofToasters <themanhimself at sgregoratto dot me>
pkgname=goawk
pkgver=1.1.1
pkgrel=1
pkgdesc="AWK interpreter written in go"
url="https://github.com/benhoyt/goawk"
license=('MIT')
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
makedepends=('go-pie')
source=("$url/archive/v$pkgver.tar.gz")
sha256sums=('b23ec9e548b2a4f9adb1fafc06c5f19cfdf8b873a9ed46261f1845c8809a71a0')

build() {
	cd "${pkgname}-${pkgver}"
	go build \
		-gcflags "all=-trimpath=${PWD}" \
		-asmflags "all=-trimpath=${PWD}" \
		-ldflags "-extldflags ${LDFLAGS}" \
		-o "${pkgname}" .
}

check(){
	cd "${pkgname}-${pkgver}"
	go test ./...
}

package() {
	install -Dm755 "${pkgname}-${pkgver}/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
	install -Dm644 "${pkgname}-${pkgver}/LICENSE.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENCE"
}
