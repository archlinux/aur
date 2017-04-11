# Maintainer: Daniel Martí <mvdan@mvdan.cc>

pkgname=fdroidcl
_name="${pkgname}"
pkgver=0.3.1
pkgrel=1
pkgdesc="F-Droid desktop client"
url="https://github.com/mvdan/${_name}"
license=('BSD')
arch=('i686' 'x86_64')
makedepends=('git' 'go')
source=("git+${url}#tag=v${pkgver}")
sha1sums=('SKIP')

prepare() {
	cd "${srcdir}"
	mkdir -p "src/github.com/mvdan"
	git clone https://github.com/mvdan/basedir src/github.com/mvdan/basedir
	mv "${_name}" "src/github.com/mvdan/${_name}"
}

build() {
	cd "${srcdir}/src/github.com/mvdan/${_name}/cmd/${_name}"
	GOPATH="${srcdir}" go build -ldflags='-s -w'
}

package() {
	cd "${srcdir}/src/github.com/mvdan/${_name}"
	install -Dm755 "cmd/${_name}/${_name}" "${pkgdir}/usr/bin/${_name}"
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
