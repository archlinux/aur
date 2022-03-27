# Maintainer: András Wacha <awacha@gmail.com>
# Contributor: Michał Wojdyła < micwoj9292 at gmail dot com >
pkgname=python-xhtml2pdf
_name=${pkgname#python-}
pkgver=0.2.6
pkgrel=1
pkgdesc="A library for converting HTML into PDFs using ReportLab"
arch=(any)
url="https://github.com/xhtml2pdf/xhtml2pdf"
license=('Apache')
depends=(python-arabic-reshaper
         python-bidi
         python-reportlab
         python-pypdf3
         python-html5lib)
makedepends=(python-setuptools
             python-sphinx_rtd_theme
#            texlive-latexextra
             python-wheel)
source=("https://github.com/${_name}/${_name}/archive/v${pkgver}.tar.gz"  )
sha256sums=('ce0e2b711f5200f46caf2a67008700fb1de0a761f2ae92d30b21e158de05912e')
build() {
	cd ${_name}-${pkgver}
	python setup.py build
	(cd doc && make html)
#	(cd doc && make latexpdf)
}

check() {
	cd ${_name}-${pkgver}
	python setup.py test
}

package() {
	cd ${_name}-${pkgver}
	python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
	mkdir -p ${pkgdir}/usr/share/doc/${pkgname}
	cp ${srcdir}/${_name}-${pkgver}/doc/build/html ${pkgdir}/usr/share/doc/${pkgname} -R
#	cp ${srcdir}/${_name}-${pkgver}/doc/build/latex/${_name}.pdf ${pkgdir}/usr/share/doc/${_name}.pdf
}
