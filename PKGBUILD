# Maintainer: Adrian Perez de Castro <aperez@igalia.com>
pkgname=gomuks-git
pkgdesc='A terminal based Matrix client written in Go'
pkgver=0.r485
pkgrel=1
url='https://github.com/tulir/gomuks'
license=(GPL3)
arch=(x86_64 i686)
depends=(libolm)
makedepends=(go-pie git)
provides=("${pkgname%-git}")
conflicts=("${provides[@]}")
source=("${pkgname}::git+${url}")
sha512sums=(SKIP)

pkgver () {
	cd "${pkgname}"
    echo "0.r$(git rev-list --count HEAD)"
}

build () {
	cd "${pkgname}"
	local curdir=$(pwd)
	go build -v \
		-gcflags "all=-trimpath=${curdir}" \
		-asmflags "all=-trimpath=${curdir}" \
		-ldflags "-extldflags '${LDFLAGS}'" \
		.
}

package () {
	cd "${pkgname}"
	install -Dm755 gomuks "${pkgdir}/usr/bin/gomuks"
	install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
