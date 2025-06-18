# with fixes by 0xAA <0xaa@dmg.sx>
_pkgname="cgasm"
pkgname="${_pkgname}-git"
pkgver=1.0.0.r0.g6c54b38
pkgrel=1
pkgdesc="Commandline IA32/AMD64 documentation"
arch=('i686' 'x86_64')
url="https://github.com/bnagy/cgasm"
license=('GPL2')
makedepends=('git' 'go')

source=("${_pkgname}"::"git+${url}.git")
md5sums=('SKIP')

pkgver () {
	cd "${srcdir}/${_pkgname}"
	git describe --long --tags --abbrev=7 --exclude='*[a-zA-Z][a-zA-Z]*' \
	| sed -E 's/^[^0-9]*//;s/([^-]*-g)/r\1/;s/-/./g'
}

prepare() {
	cd "${srcdir}/${_pkgname}"
	go mod init github.com/bnagy/cgasm
	go mod tidy
}

build() {
	cd "${srcdir}/${_pkgname}"
	go build
}

package() {
	cd "${srcdir}/${_pkgname}"
	install -d -m755 "${pkgdir}/usr/bin"
	install -m755 cgasm "${pkgdir}/usr/bin/cgasm"
}
