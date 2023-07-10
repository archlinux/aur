# Maintainer: myname <mebitek@zohomail.eu>
pkgname=tui-deck
_gitname=tui-deck
pkgver=0.5.15.r0.g6489538
pkgrel=1
pkgdesc="A TUI frontend for Nextcloud Deck app written in GO using the Rich Interactive Widgets for Terminal UIs"
url="https://github.com/mebitek/tui-deck"
license=("GPL3")
source=("git+$url")
md5sums=("SKIP")
arch=("x86_64")
provides=(tui-deck)
conflicts=(tui-deck)
makedepends=("git" "go")

build() {
	cd $_gitname
	go build \
		-gcflags "all=-trimpath=${PWD}" \
		-asmflags "all=-trimpath=${PWD}" \
		-ldflags "-extldflags ${LDFLAGS}" \
		-o $_gitname
}

package() {
	cd $_gitname
	install -Dm755 --no-target-directory "${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
}

pkgver() {
	cd "$_gitname"
	git describe --long --abbrev=7 --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}
