# Maintainer: Jameson Pugh <imntreal@gmail.com>

pkgname=mfdb-json-git
pkgver=r1586.b29fa1d
pkgrel=1
pkgdesc="mythfilldatabase replacement for new SchedulesDirect format"
arch=('any')
url="https://github.com/SchedulesDirect/mfdb-json"
license=('GPLv2')
depends=('php-composer')
provides=(mfdb-json)
conflicts=(mfdb-json)
source=("mfdb-json-git::git://github.com/SchedulesDirect/mfdb-json#branch=API-20141201")
sha256sums=('SKIP')

pkgver() {
  cd ${pkgname}
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "${srcdir}/${pkgname}"

	sed -i 's/~/\/opt/' mfdb.sh
	composer install
	install -dm 755 "${pkgdir}/opt/mfdb-json"
	install -dm 755 "${pkgdir}/usr/bin"
	cp -rv ./* "${pkgdir}/opt/mfdb-json"
	ln -s /opt/mfdb-json/sd-utility.php "${pkgdir}/usr/bin/sd-utility"
	ln -s /opt/mfdb-json/mfdb-json.php "${pkgdir}/usr/bin/mfdb-json"
}

# vim: set ts=2 sw=2 ft=sh noet:
