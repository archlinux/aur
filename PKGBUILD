# Maintainer: Adrian Perez de Castro <aperez@igalia.com>
# Maintainer: Vlad <ejiek@mail.ru>
pkgname=gomuks
pkgdesc='A terminal based Matrix client written in Go'
pkgver=0.2.2
pkgrel=1
url='https://github.com/tulir/gomuks'
license=(GPL3)
arch=(x86_64 i686 armv7)
depends=(libolm)
makedepends=(go)
source=($pkgname-$pkgver.tar.gz::"https://codeload.github.com/tulir/gomuks/tar.gz/v$pkgver")
sha512sums=('674a26d285d627118b53ceae2e7cd42bb837e1d0c2f8f29d29c16915270bfc0cf51bbc799302ce0959739ed58e3215d10ba4c8b8467871f031bab00961b06587')

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
