# Maintainer: Katie Wolfe <wolfe@katie.host>
pkgname=udprelay-git
pkgver=1.0.1
pkgrel=1
pkgdesc=""
arch=('any')
url='https://git.sr.ht/~kt/udprelay'
license=('Unlicense')
depends=()
makedepends=('make' 'scdoc' 'go' 'git')
provides=('udprelay')
conflicts=('udprelay')
source=('udprelay::git+https://git.sr.ht/~kt/udprelay')
sha512sums=('SKIP')

pkgver() {
	cd "${srcdir}/udprelay"
	printf "%s" "$(git describe --match 'v*' | sed 's/\([^-]*-\)g/r\1/;s/-/./g;s/^v//')"
}

build() {
	export GOPATH="${srcdir}/go"
	cd "${srcdir}/udprelay"
	go get -v .
	make udprelay docs
}

package() {
	cd "${srcdir}/udprelay"
	install -Dm755 udprelay "${pkgdir}/usr/bin/udprelay"
	install -Dm644 udprelay.1 "${pkgdir}/usr/share/man/man1/udprelay.1"
	install -Dm644 udprelay.7 "${pkgdir}/usr/share/man/man7/udprelay.7"
}
