# Maintainer: Brennon M. <bjm121@pitt.edu>
# Contributer: Morgana <morganamilo@gmail.com>

# Repurposed from Pep/8 PKGBUILD by Morgana

pkgname=pep9-asm-git
_pkgname=pep9
pkgver=9.1
pkgrel=1
pkgdesc="Pep/9 assembler and simulator for Computer Systems (5th edition) by Stanley Warford"
arch=("x86_64")
url="http://computersystemsbook.com/5th-edition/pep9/"
license=('GPL')
depends=('qt5-base' 'qt5-webengine')
source=("git+https://github.com/StanWarford/${_pkgname}")
provides=('pep9-asm')
md5sums=('SKIP')

build() {
	cd "${srcdir}/${_pkgname}"
	qmake pep9.pro
	make
}

pkgver() {
	cd "${srcdir}/${_pkgname}"
	printf "%s.r%s.%s" "$(grep -om1 'version [0-9\.]\+' aboutpep.ui | cut -d " " -f 2)" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	cd "${srcdir}/${_pkgname}"
	install -Dm755 Pep9 "${pkgdir}/usr/bin/pep9"
	install -Dm644 LICENSE.txt "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}

