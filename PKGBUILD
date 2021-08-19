# Maintainer: Matthew McGinn <mamcgi@gmail.com>
# Contributor: Chris Clonch <chris at theclonchs dot com>
# Contributor: Justin Dray <justin@dray.be>

pkgname='chronograf-bin'
_pkgname='chronograf'
pkgver=1.9.0
pkgrel=1
pkgdesc='Time-series data visualization tool for InfluxDB'
_github_url="https://github.com/influxdata/chronograf"
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
source=("${_pkgname}.install" "${_pkgname}.tmpfiles")
sha256sums=('1252f86f1e249be19eec4f7fe388300fb5f8d1cad5603b2ea87ea07362dc8768'
            'c81f81247b99928bd20428f7188c1790fff89c4521f3322a8ff148272b24bab6')
sha256sums_x86_64=('24bc17b0fe93344da8cb49a7fd0f5b6a62f50ddcc8cb13fe60734a33ee3804b9')
sha256sums_i686=('a7e697647743c12a71dbe5439e4474627d76c8748d9330945271a693c1912885')
sha256sums_armv7h=('246df493ac806bd5b70cc76f6a47271ab48903e9698b1595add0630ea413ced9')
sha256sums_aarch64=('bab4c1e5aef91ecf0962b1a780a2935037e393ff5eabf0b669297cbd89a385a2')

package() {
	# binary
	mkdir -m755 -p ${pkgdir}/etc
	mkdir -m755 -p ${pkgdir}/usr/{bin,lib,share}
	mkdir -m755 -p "${pkgdir}/usr/share/chronograf/canned"
	install -Dm644 chronograf.tmpfiles "${pkgdir}/usr/lib/tmpfiles.d/chronograf.conf"
	install -Dm644 "${srcdir}/${_pkgname}-${pkgver}-1/etc/logrotate.d/chronograf" "${pkgdir}/etc/logrotate.d/chronograf"
	install -Dm755 "${srcdir}/${_pkgname}-${pkgver}-1/usr/bin/chronograf" "${pkgdir}/usr/bin/chronograf"
	install -Dm644 "${srcdir}/${_pkgname}-${pkgver}-1/usr/lib/chronograf/scripts/chronograf.service" "${pkgdir}/usr/lib/systemd/system/chronograf.service"
	install -Dm644 ${srcdir}/${_pkgname}-${pkgver}-1/usr/share/chronograf/canned/* "${pkgdir}/usr/share/chronograf/canned/."
}
