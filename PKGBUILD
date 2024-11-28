# Maintainer: Uģis Gērmanis <ugis@germanis.lv>
_name=10mb.video
pkgname=${_name}-git
pkgver=r5.940b95e
pkgrel=1
pkgdesc="Fit a video into a 10mb file (Discord nitro pls?)"
arch=(any)
url="https://github.com/ugjka/10mb.video"
license=('MIT')
makedepends=(go git)
provides=("${_name}")
options=(!debug)
source=("${pkgname}::git+https://github.com/ugjka/${_name}.git#branch=main")
md5sums=("SKIP")

pkgver() {
 	cd "$pkgname"
 	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

build() {
	cd "$pkgname"
	GOPATH="${srcdir}"/go go build -modcacherw
}

package() {
	cd "$pkgname"
	install -Dm755 ${_name} "${pkgdir}"/usr/bin/${_name}
	install -Dm644 LICENSE "${pkgdir}"/usr/share/licenses/${_name}/LICENSE
}
