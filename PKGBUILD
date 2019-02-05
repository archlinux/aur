# Maintainer: Daniel Martí <mvdan@mvdan.cc>

pkgname=fdroidcl
_name="${pkgname}"
pkgver=0.5.0
pkgrel=1
pkgdesc="F-Droid desktop client"
url="https://github.com/mvdan/${_name}"
license=('BSD')
arch=('i686' 'x86_64')
depends=('android-tools')
makedepends=('git' 'go')
source=("git+${url}#tag=v${pkgver}")
sha1sums=('SKIP')

prepare() {
	cd "${srcdir}"
	mkdir -p "src/mvdan.cc"
	mv "${_name}" "src/mvdan.cc/${_name}"
}

build() {
	cd "${srcdir}/src/mvdan.cc/${_name}"
	GOPATH="${srcdir}" go build -ldflags='-s -w'
}

package() {
	cd "${srcdir}/src/mvdan.cc/${_name}"
	install -Dm755 "${_name}" "${pkgdir}/usr/bin/${_name}"
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
