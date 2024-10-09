# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dor com>

_projname=proot
pkgname=care
_pkgname=care
pkgver=5.4.0
pkgrel=1
pkgdesc="Comprehensive Archiver for Reproducible Execution"
arch=('i686' 'x86_64')
url="https://proot-me.github.io/"
license=('GPL')
provides=('care')
depends=('proot')
makedepends=('python-docutils' 'libxslt')
source=(${_projname}-v${pkgver}.tar.gz::https://github.com/cedric-vincent/${_projname}/archive/v${pkgver}.tar.gz)
sha256sums=('29248aac2a7ce10c3bd5ee5602742ec33b2532310ff9cf73b79f3c133e5a5f68')

build() {
	cd "${srcdir}"/${_projname}-${pkgver}/src || exit 1
	make -f GNUmakefile ${_pkgname}

	cd "${srcdir}"/${_projname}-${pkgver}/doc || exit 1
	make -f GNUmakefile ${_pkgname}/man.1 ${_pkgname}/index.html
}

package() {
	cd "${srcdir}"/${_projname}-${pkgver} || exit 1

	install -m755 -d "${pkgdir}"/usr/bin
	install -m755 src/${_pkgname} "${pkgdir}"/usr/bin

	install -m755 -d "${pkgdir}"/usr/share/man/man1/
	install -m644 -T doc/${_pkgname}/man.1 "${pkgdir}"/usr/share/man/man1/${_pkgname}.1

	install -m755 -d "${pkgdir}"/usr/share/doc/${pkgname}/
	install -m644 CHANGELOG.rst "${pkgdir}"/usr/share/doc/${pkgname}
	install -m644 doc/${_pkgname}/index.html "${pkgdir}"/usr/share/doc/${pkgname}
	install -m644 doc/${_pkgname}/manual.rst "${pkgdir}"/usr/share/doc/${pkgname}

	install -m755 -d "${pkgdir}"/usr/share/doc/${pkgname}/stylesheets
	install -m644 doc/${_pkgname}/stylesheets/* "${pkgdir}"/usr/share/doc/${pkgname}/stylesheets
}
