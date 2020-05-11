# Maintainer: Adrian Perez de Castro <aperez@igalia.com>
# Maintainer: Vlad <ejiek@mail.ru>
pkgname=gomuks
pkgdesc='A terminal based Matrix client written in Go'
pkgver=0.1.0
pkgrel=1
url='https://github.com/tulir/gomuks'
license=(GPL3)
arch=(x86_64 i686)
depends=(libolm)
makedepends=(go-pie)
source=($pkgname-$pkgver.tar.gz::"https://codeload.github.com/tulir/gomuks/tar.gz/v0.1.0")
sha512sums=('63b97a000f19ee18287962c1c7ff74e080b2c3a0d86c6433f8c67086f035d4f0358577a022b1e6933a27f8a162b69e55445a9493f575fca6e27e7aae7c6cb21c')

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
