# Maintainer: Matthew McGinn <mamcgi@gmail.com>
# Contributor: Chris Clonch <chris at theclonchs dot com>
# Contributor: Justin Dray <justin@dray.be>

pkgname='chronograf-bin'
_pkgname='chronograf'
pkgver='1.3.9.0'
pkgrel='1'
pkgdesc='Time-series data visualization tool for InfluxDB'
arch=('x86_64' 'i686' 'armv7h' 'aarch64')
url='https://influxdata.com/time-series-platform/chronograf/'
license=('AGPL')
depends=('glibc')
provides=("chronograf")
conflicts=("chronograf")
install="${_pkgname}.install"
source_x86_64=("https://dl.influxdata.com/chronograf/releases/chronograf-${pkgver}_linux_amd64.tar.gz")
source_aarch64=("https://dl.influxdata.com/chronograf/releases/chronograf-${pkgver}_linux_arm64.tar.gz")
source_i686=("https://dl.influxdata.com/chronograf/releases/chronograf-${pkgver}_linux_i386.tar.gz")
source_armv7h=("https://dl.influxdata.com/chronograf/releases/chronograf-${pkgver}_linux_armhf.tar.gz")
source=("${_pkgname}.install")
sha256sums=('1252f86f1e249be19eec4f7fe388300fb5f8d1cad5603b2ea87ea07362dc8768')
sha256sums_x86_64=('8bc1b1893f730d6ef03007794a067b48c0af39699dae5bc702146fc26d9bd30e')
sha256sums_i686=('39d08df8da8b978b549984f70764d3f675bb09946cd7ccdf6bf730125cf20334')
sha256sums_armv7h=('6b9978e4d2a4a08b7f4cccaa7831dadd158e9b31994e3a27035e26338a11a2cf')
sha256sums_aarch64=('7913e9ee462b953e1309c05621bda6ad2a253fee9993208df8f53e0f8f204d87')

package() {
	# binary
        mkdir -m755 -p ${pkgdir}/etc
        mkdir -m755 -p ${pkgdir}/var/{log,lib}
        mkdir -m755 -p ${pkgdir}/usr/{bin,lib,share}
	mkdir -m755 -p "${pkgdir}/usr/share/chronograf/canned"
	install -Dm644 "${srcdir}/${_pkgname}-${pkgver}-1/etc/logrotate.d/chronograf" "${pkgdir}/etc/logrotate.d/chronograf"
        install -Dm755 "${srcdir}/${_pkgname}-${pkgver}-1/usr/bin/chronograf" "${pkgdir}/usr/bin/chronograf"
	install -Dm644 "${srcdir}/${_pkgname}-${pkgver}-1/usr/lib/chronograf/scripts/chronograf.service" "${pkgdir}/usr/lib/systemd/system/chronograf.service"
	install -Dm644 ${srcdir}/${_pkgname}-${pkgver}-1/usr/share/chronograf/canned/* "${pkgdir}/usr/share/chronograf/canned/."
}
