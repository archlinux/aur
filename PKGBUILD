# Maintainer: Adrian Perez de Castro <aperez@igalia.com>
# Maintainer: Vlad <ejiek@mail.ru>
pkgname=gomuks
pkgdesc='A terminal based Matrix client written in Go'
pkgver=0.2.0
pkgrel=1
url='https://github.com/tulir/gomuks'
license=(GPL3)
arch=(x86_64 i686 armv7)
depends=(libolm)
makedepends=(go-pie)
source=($pkgname-$pkgver.tar.gz::"https://codeload.github.com/tulir/gomuks/tar.gz/v$pkgver")
sha512sums=('86b74b5f8cba9855b5a9706e4d698232adb9d500a1261a5ca3f2cc781c62e99e65b4b02d39a28c8c602b5cd880fa5be9e91cf1754b9dc09cad7e3cf1974ac745')

build () {
	cd "$pkgname-$pkgver"
	local curdir=$(pwd)
	go build -v \
		-gcflags "all=-trimpath=${curdir}" \
		-asmflags "all=-trimpath=${curdir}" \
		-ldflags "-extldflags '${LDFLAGS}'" \
		.
}

package () {
	cd "$pkgname-$pkgver"
	install -Dm755 gomuks "${pkgdir}/usr/bin/gomuks"
	install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
