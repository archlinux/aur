# Maintainer: Andriy Cherniy <qugalet@m0e.space>

pkgname=dwm-polybar-git
pkgdesc='Polybar script in Go without recompiling entire polybar '
pkgver=0.r6
pkgrel=1
url='https://github.com/Andrmist/dwm-polybar'
license=(MIT)
arch=(x86_64 i686)
makedepends=(go-pie git)
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
	install -Dm755 dwm-polybar "${pkgdir}/usr/bin/dwm-polybar"
}
