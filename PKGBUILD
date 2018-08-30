# Maintainer: Morgana <morganamilo@gmail.com>

pkgname=pep8-asm-git
_pkgname=pep8
pkgver=8.1.3.r478.5af5c3d
pkgrel=1
pkgdesc="Pep/8 assembler and simulator"
arch=("x86_64")
url="http://computersystemsbook.com/4th-edition/pep8/"
license=('GPL')
depends=('qt5-base' 'qt5-webengine')
source=("git+https://github.com/StanWarford/${_pkgname}")
provides=('pep8-asm')
md5sums=('SKIP')

build() {
	cd "${srcdir}/${_pkgname}"
	qmake pep8.pro
	make
}

pkgver() {
	cd "${srcdir}/${_pkgname}"
	printf "%s.r%s.%s" "$(grep -om1 'version [0-9\.]\+' aboutpep.ui | cut -d " " -f 2)" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	cd "${srcdir}/${_pkgname}"
	install -Dm755 Pep8 "${pkgdir}/usr/bin/pep8"
	install -Dm644 LICENSE.txt "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}

