# Maintainer: Matthew McGinn <mamcgi@gmail.com>
# Contributor: Chris Clonch <chris at theclonchs dot com>
# Contributor: Justin Dray <justin@dray.be>

pkgname='chronograf-bin'
_pkgname='chronograf'
pkgver=1.8.7
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
sha256sums_x86_64=('32e2b28dcc53eaa8f9bea21e5762d488042e7748f2ae3707070a80e77cd8ba4b')
sha256sums_i686=('e03dc59e91588292780b9ff9e879df7b854734c28f59778fa85af5499b62a07c')
sha256sums_armv7h=('6a559b02b0e473d215eb4730662e6ccf855717b70ea8a394f0c046168619429c')
sha256sums_aarch64=('4e5b7433c4a1604ddd7b92f2421aecff6558e84d7a0cab65d5e583d8a3ac4634')

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
