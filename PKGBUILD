# Maintainer: Adrian Perez de Castro <aperez@igalia.com>
# Maintainer: Vlad <ejiek@mail.ru>
pkgname=gomuks
pkgdesc='A terminal based Matrix client written in Go'
pkgver=0.2.3
pkgrel=1
url='https://github.com/tulir/gomuks'
license=(GPL3)
arch=(x86_64 i686 armv7)
depends=(libolm)
makedepends=(go)
source=($pkgname-$pkgver.tar.gz::"https://codeload.github.com/tulir/gomuks/tar.gz/v$pkgver")
sha512sums=('0ccc467ed0230b886fd7dba30e5e6000fb0e211e84cce690e6a9db860e460b07b03d4ca6c96147843e5b8427eab3792218d92ae747449afe6cfe7790b06fe8db')

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
