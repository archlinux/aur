# Maintainer: Daniel Martí <mvdan@mvdan.cc>

pkgname=shfmt
_pkg=sh
_name="${pkgname}"
pkgver=1.2.0
pkgrel=1
pkgdesc="Format shell programs"
url="https://github.com/mvdan/${_pkg}"
license=('BSD')
arch=('i686' 'x86_64')
makedepends=('git' 'go')
source=("git+${url}#tag=v${pkgver}")
sha1sums=('SKIP')

prepare() {
	cd "${srcdir}"
	mkdir -p "src/github.com/mvdan"
	mv "${_pkg}" "src/github.com/mvdan/${_pkg}"
}

build() {
	cd "${srcdir}/src/github.com/mvdan/${_pkg}/cmd/${_name}"
	GOPATH="${srcdir}" go build -ldflags='-s -w'
}

package() {
	cd "${srcdir}/src/github.com/mvdan/${_pkg}"
	install -Dm755 "cmd/${_name}/${_name}" "${pkgdir}/usr/bin/${_name}"
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
