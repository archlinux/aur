# Maintainer: Jameson Pugh <imntreal@gmail.com>

pkgname=mfdb-json-git
pkgver=cce6870
pkgrel=1
pkgdesc="mythfilldatabase replacement for new SchedulesDirect format"
arch=('any')
url="https://github.com/SchedulesDirect/mfdb-json"
license=('GPLv2')
depends=('php-composer')
provides=(mfdb-json)
conflicts=(mfdb-json)
source=("mfdb-json-git::git://github.com/SchedulesDirect/mfdb-json#branch=API-20140530")
sha256sums=('SKIP')

pkgver() {
  cd ${pkgname}
  git describe --always | sed 's|-|.|g'
}

package() {
  cd "${srcdir}/${pkgname}"

	composer install
	install -dm 755 "${pkgdir}/opt/mfdb-json"
	install -dm 755 "${pkgdir}/usr/bin"
	cp -rv ./* "${pkgdir}/opt/mfdb-json"
	ln -s /opt/mfdb-json/sd-utility.php "${pkgdir}/usr/bin/sd-utility"
	ln -s /opt/mfdb-json/mfdb-json.php "${pkgdir}/usr/bin/mfdb-json"
}

# vim: set ts=2 sw=2 ft=sh noet:
