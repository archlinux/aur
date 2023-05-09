# Maintainer: David Borzek <dev@davidborzek.de>
_pkgname=spofi
pkgname=spofi-git
pkgver=r16.125421b
pkgrel=1
pkgdesc="Control spotify using rofi."
arch=(x86_64)
url="https://github.com/davidborzek/spofi"
license=('MIT')
depends=('rofi')
makedepends=('go' 'git')
provides=(spofi)
source=("$_pkgname"::"git+$url#branch=main")
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/spofi"
	printf 'r%s.%s' "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "${_pkgname}"
	if [[ "$GOPATH" == "" ]]; then
		GOPATH="$HOME/go" go build -o spofi
	else
		go build -o spofi
	fi
}

package() {
	cd "${_pkgname}"
	install -Dm755 spofi "${pkgdir}/usr/bin/spofi"
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${_pkgname}"
}
