# Maintainer: Stefan Zanko <szanko at protonmail dot com>

pkgname=dblatexpy3
pkgver=0.3.12
pkgrel=2
pkgdesc='DocBook (XML and SGML) to DVI, PDF, PostScript converter using latex with python3 support.'
arch=('any')
url='http://dblatex.sourceforge.net/'
license=('GPL')
depends=('docbook-xsl' 'docbook-xml' 'libxslt' 'python' 'texlive-core' 'texlive-htmlxml'
         'texlive-latexextra' 'texlive-pictures' 'texlive-science')
conflicts=('dblatex')
source=("https://sourceforge.net/projects/${conflicts}/files/${conflicts}/${conflicts}-${pkgver}/${conflicts}3-${pkgver}pre1.tar.bz2/download")
md5sums=('19f0e0e0a70cbe281fe4c7175065ab8f')

prepare(){
	mv download ${pkgname}
}

package() {
	cd "${srcdir}/${conflicts}-${pkgver}pre1"

	python3 setup.py install --root "${pkgdir}" --catalogs=/etc/xml/docbook-xml
	sed -i -e "s,${pkgdir},," -e "s,#!/usr/bin/env python,#!/usr/bin/env python," \
		"${pkgdir}/usr/bin/dblatex"
}
