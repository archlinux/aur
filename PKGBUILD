# Maintainer: András Wacha <awacha@gmail.com>
# Contributor: Michał Wojdyła < micwoj9292 at gmail dot com >
pkgname=python-xhtml2pdf
_name=${pkgname#python-}
pkgver=0.2.7
pkgrel=1
pkgdesc="A library for converting HTML into PDFs using ReportLab"
arch=(any)
url="https://github.com/xhtml2pdf/xhtml2pdf"
license=('Apache')
depends=(python-arabic-reshaper
         python-bidi
         python-reportlab
         python-pypdf3
         python-html5lib
         python-svglib
         python-pyhanko
)
makedepends=(python-setuptools
#            python-sphinx_rtd_theme
#            texlive-latexextra
             python-wheel)
source=("${_name}-${pkgver}.tar.gz::https://github.com/xhtml2pdf/xhtml2pdf/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('9157368e7cba3586cc119dfe339abaf5aa9b1e8150001c36c159816139e3718d')
build() {
	cd ${_name}-${pkgver}
	python setup.py build
#	(cd docs && make html)
#	(cd docs && make latexpdf)
}

check() {
	cd ${_name}-${pkgver}
	python setup.py test
}

package() {
	cd ${_name}-${pkgver}
	python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
#	mkdir -p ${pkgdir}/usr/share/doc/${pkgname}
#	cp ${srcdir}/${_name}-${pkgver}/docs/build/html ${pkgdir}/usr/share/doc/${pkgname} -R
#	cp ${srcdir}/${_name}-${pkgver}/docs/build/latex/${_name}.pdf ${pkgdir}/usr/share/doc/${_name}.pdf
}