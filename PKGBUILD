# Maintainer: Adrian Perez de Castro <aperez@igalia.com>
# Maintainer: Vlad <ejiek@mail.ru>
pkgname=gomuks
pkgdesc='A terminal based Matrix client written in Go'
pkgver=0.3.0
pkgrel=1
url=https://github.com/tulir/gomuks
license=(GPL3)
arch=(x86_64 i686 arm armv6h armv7h aarch64)
depends=(libolm)
makedepends=(go)
source=($pkgname-$pkgver.tar.gz::"https://codeload.github.com/tulir/gomuks/tar.gz/v$pkgver")
sha512sums=('9f001db7b926779f4f33dd0fa3c5d4a88ec31862ecbcfd529846b187d3ac26f70d2836250bc827a8852b8af62a32a3e2e20861f849cfa2d39bf1784967c4c80a')

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
