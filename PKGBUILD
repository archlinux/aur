# Maintainer: Daniel Martí <mvdan@mvdan.cc>

pkgname=xurls
_name="${pkgname}"
pkgver=2.0.0
pkgrel=1
pkgdesc="Extract urls from plain text"
url="https://github.com/mvdan/${_name}"
license=('BSD')
arch=('i686' 'x86_64')
makedepends=('git' 'go')
source=("git+${url}#tag=v${pkgver}")
sha1sums=('SKIP')

prepare() {
	cd "${srcdir}"
	mkdir -p "src/mvdan.cc"
	mv "${_name}" "src/mvdan.cc/${_name}"
}

build() {
	cd "${srcdir}/src/mvdan.cc/${_name}/cmd/${_name}"
	GOPATH="${srcdir}" go build -ldflags='-w -s'
}

package() {
	cd "${srcdir}/src/mvdan.cc/${_name}"
	install -Dm755 "cmd/${_name}/${_name}" "${pkgdir}/usr/bin/${_name}"
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
