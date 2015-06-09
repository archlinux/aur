# Maintainer: Guido <qqqqqqqqq9 at web dot de>
# Contributor: Emmanuel Gil Peyrot <linkmauve at linkmauve dot fr>

pkgname=sozi
pkgver=13.11
pkgrel=1
_extraver='30213629'
pkgdesc='An Inkscape extension that creates SVG-based presentations, using JavaScript'
url="http://sozi.baierouge.fr/"
license=('GPL3' 'MIT')
depends=('python2' 'inkscape' 'pygtk' 'python2-lxml')
_lang="de es fr it nl nn pt_BR sv"
source=("https://github.com/senshu/Sozi/releases/download/13.11/sozi-release-13.11-30213629.zip")
arch=('any')
sha256sums=('6a66298e9d3fd509f252344d884d51497ed2eb599f26846ba8156dd021d444d9')

package() {
	cd "${srcdir}/sozi-release-${pkgver}-${_extraver}"

	mkdir -p ${pkgdir}/usr/share/inkscape/extensions/sozi/lang
 	install -D -m644 *.py *.inx ${pkgdir}/usr/share/inkscape/extensions

	cd sozi
	install -D -m644 *.py *.glade *.css *.js *.png ${pkgdir}/usr/share/inkscape/extensions/sozi
	
	mkdir -p ${pkgdir}/usr/share/licenses/sozi
	install -D -m644 MIT-license.txt ${pkgdir}/usr/share/licenses/sozi/LICENSE

	cd lang
	cp -r $_lang "${pkgdir}/usr/share/inkscape/extensions/sozi/lang/"
  sed -i  -e "s@\#\!/usr/bin/env python[2]*@\#\!/usr/bin/env python2@g" ${pkgdir}/usr/share/inkscape/extensions/sozi*.py
}
