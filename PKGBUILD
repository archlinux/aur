# Maintainer: Jan Claussen <jan.claussen at web dot de>
# Maintainer: Julian Daube <joposter at gmail dot com>
# Contributer: Jan Claussen jan.claussen at web dot de>

pkgname=plecs-blockset
_pkgname="plecs-blockset"
pkgver=v4.9.4
_pkgver=$(echo "${pkgver#v}" | sed 's/\./-/g')
pkgrel=1
pkgdesc="PLECS integration into MATLAB/Simulink (license needed / 30-days free trial)"
url='http://www.plexim.com/de/products/plecs_blockset'
arch=('x86_64')
license=('custom')
provides=('plecs-blockset')
depends=('zlib')
options=(!strip)
source=("plecs-blockset.desktop" 
	"plecs-blockset.png" 
	"plecs-blockset.sh" 
	"${pkgname}-${pkgver}-x86_64.tar.gz::https://www.plexim.com/sites/default/files/packages/plecs-blockset-${_pkgver}_linux64.tar.gz")
md5sums=('381be723bc77af74c5aca5f070d5925c'
         '8ed62f1ce2de47c761c9244531dc154e'
         'fa37afb26f11e1dd331e886eb175a2ef'
         '92d87b123bd53222191e0b3e56900d71')

package() {
	# Install icon an desktop file
	install -Dm 644 "${srcdir}/plecs-blockset.png" "${pkgdir}/usr/share/pixmaps/plecs-blockset.png"
	install -Dm 664 "${srcdir}/plecs-blockset.desktop" "${pkgdir}/usr/share/applications/plecs-blockset.desktop"

	# Install license
	install -Dm 664 "${srcdir}/plecs/license.txt" "${pkgdir}/usr/share/licenses/plecs-blockset/license.txt"

	# Install application
	install -d "${pkgdir}/opt"
	cp -a "${srcdir}/plecs" "${pkgdir}/opt/plecs-blockset"  

	# install desktop file
	install -Dm 755 "${srcdir}/plecs-blockset.sh" "${pkgdir}/usr/bin/plecs-blockset"
}
