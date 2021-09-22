# Maintainer: Adrian Perez de Castro <aperez@igalia.com>
# Maintainer: Vlad <ejiek@mail.ru>
pkgname=gomuks
pkgdesc='A terminal based Matrix client written in Go'
pkgver=0.2.4
pkgrel=2
url=https://github.com/tulir/gomuks
license=(GPL3)
arch=(x86_64 i686 arm armv6h armv7h aarch64)
depends=(libolm)
makedepends=(go)
source=($pkgname-$pkgver.tar.gz::"https://codeload.github.com/tulir/gomuks/tar.gz/v$pkgver")
sha512sums=('d16bd4cb7ae12f172e290916450a6e11900259ceba60ce03a9f19f4351647929984701f4d859a467a88c4dd4ae5e9bf2d7206eeb567763c478c2b357e88ca65f')

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
