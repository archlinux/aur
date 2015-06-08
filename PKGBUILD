# Maintainer: Jesús Ruiz de Infante <jesrui at gmail dot com>

_pkgname=finddupes
pkgname=${_pkgname}-git
pkgver=0.2
pkgrel=1
pkgdesc='finds duplicate files in a given set of directories'
url='https://github.com/jesrui/finddupes'
arch=('i686' 'x86_64' 'armv7h' 'armv6h')
license=('custom:MIT')
makedepends=('git')
checkdepends=('valgrind')
source=("${_pkgname}::git+https://github.com/jesrui/finddupes")
sha1sums=('SKIP')

provides=("${_pkgname}")
conflicts=("${_pkgname}")

pkgver() {
	cd "${srcdir}/${_pkgname}"
        git describe --tags | sed "s/-/./g"
}

build() {
	cd "${srcdir}/${_pkgname}"
	make
}

check() {
	cd "${srcdir}/${_pkgname}"
	./check.sh
}

package() {
	cd "${srcdir}/${_pkgname}"
        make install PREFIX="${pkgdir}/usr"
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
