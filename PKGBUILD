# Maintainer: Jan Claussen <jan.claussen10 at web dot de>
# Maintainer: Julian Daube <joposter at gmail dot com>

pkgname=plecs-standalone
_pkgname="plecs"
pkgver=v4.9.5
_pkgver=$(echo "${pkgver#v}" | sed 's/\./-/g')
pkgrel=1
pkgdesc="A circuit simulation tool written by Plexim (license needed / 30-days free trial)"
url='https://www.plexim.com/de/products/plecs/plecs_standalone'
arch=('x86_64')
license=('custom')
provides=('plecs-standalone')
source=("plecs.desktop" 
	"plecs.png"
	"plecs.sh"
	"${pkgname}-${pkgver}-x86_64.tar.gz::https://www.plexim.com/sites/default/files/packages/plecs-standalone-${_pkgver}_linux64.tar.gz")
options=(!strip)
md5sums=('7e0990a952785f929402da88efbd6cde'
         '8ed62f1ce2de47c761c9244531dc154e'
         '760ba8ecadc6dd64bf7ba6931ef09bc6'
         '9d4accf74e1f7360eed95bf76e0f1162')

package() {
	# Install icon an desktop file
	install -Dm 664 "${srcdir}/plecs.desktop" "${pkgdir}/usr/share/applications/plecs.desktop"
	install -Dm 644 "${srcdir}/plecs.png" "${pkgdir}/usr/share/pixmaps/plecs.png"

	# Install license
	install -Dm 664 "${srcdir}/plecs/license.txt" "${pkgdir}/usr/share/licenses/plecs/license.txt"

	# Install application
	install -d "${pkgdir}/opt"
	cp -a "${srcdir}/plecs" "${pkgdir}/opt/plecs"

	# Install wrapper start script
	install -Dm 755 ${srcdir}/plecs.sh ${pkgdir}/usr/bin/plecs
}
