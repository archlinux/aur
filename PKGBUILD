# Maintainer: surefire <surefire@cryptomile.net>


pkgname='dbninja'
pkgver=3.2.7
pkgrel=1
pkgdesc="Advanced web-based application for MySQL database administration and development"
arch=("any")
url="http://www.dbninja.com/"
license=("custom: EULA")
depends=("php")
source=("dbninja-${pkgver}.tar.gz::http://www.dbninja.com/download/dbninja.tar.gz"
		"service")
md5sums=('e6ca2716b529e5a874f151a694a83e12'
         'aff1d2120e5e753b160ae8deeb333978')

install="install"

package() {
	_instdir="/usr/share/webapps/dbninja"
	_vardir="/var/lib/dbninja"

	install -Dm0644 "service" "${pkgdir}/usr/lib/systemd/system/dbninja-localhost.service"

	cd "${srcdir}/${pkgname}"

	install -dm0755 "${pkgdir}/${_instdir}"
	install -dm0755 "${pkgdir}/${_vardir}"
	install -dm0755 "${pkgdir}/usr/share/licenses/${pkgname}"

	chown nobody "_users"

	mv "_users" "${pkgdir}/${_vardir}"

	cp -r . "${pkgdir}/${_instdir}"

	ln -s "${_vardir}/_users" "${pkgdir}/${_instdir}/_users"
	ln -s "${_instdir}/license.html" "${pkgdir}/usr/share/licenses/${pkgname}/license.html"
}
