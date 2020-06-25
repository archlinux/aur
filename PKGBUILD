# Maintainer: Adrian Perez de Castro <aperez@igalia.com>
# Maintainer: Vlad <ejiek@mail.ru>
pkgname=gomuks
pkgdesc='A terminal based Matrix client written in Go'
pkgver=0.1.2
pkgrel=2
url='https://github.com/tulir/gomuks'
license=(GPL3)
arch=(x86_64 i686 armv7)
depends=(libolm)
makedepends=(go-pie)
source=($pkgname-$pkgver.tar.gz::"https://codeload.github.com/tulir/gomuks/tar.gz/v$pkgver")
sha512sums=('000a29f04ef8d8e336f9b4934a4246c654ee1482fb2d39fb39a943bbaca156298ce8ae7b6eaf85f01769d224bd0644c9ba3e0c138772502b02fdfcbf8b85c6ca')

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
