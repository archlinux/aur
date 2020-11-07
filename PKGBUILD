# Maintainer: Stefan Zanko <szanko at protonmail dot com>

pkgname=dblatexpy3
pkgver=0.3.11
pkgrel=1
pkgdesc='DocBook (XML and SGML) to DVI, PDF, PostScript converter using latex with python3 support.'
arch=('any')
url='http://dblatex.sourceforge.net/'
license=('GPL')
depends=('docbook-xsl' 'docbook-xml' 'libxslt' 'python' 'texlive-core' 'texlive-htmlxml'
         'texlive-latexextra' 'texlive-pictures' 'texlive-science')
conflicts=('dblatex')
source=("https://sourceforge.net/projects/dblatex/files/dblatex/${conflicts}-${pkgver}/${conflicts}-${pkgver}py3.tar.bz2/download")
md5sums=('52226e83164afd7e21c6aafdbe5f0bbe')

prepare(){
	mv download ${pkgname}
}

package() {
	cd "${srcdir}/${conflicts}-${pkgver}py3"

	python3 setup.py install --root "${pkgdir}" --catalogs=/etc/xml/docbook-xml
	sed -i -e "s,${pkgdir},," -e "s,#!/usr/bin/env python,#!/usr/bin/env python3," \
		"${pkgdir}/usr/bin/dblatex"
}
