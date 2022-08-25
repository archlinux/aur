# Maintainer: Matthew McGinn <mamcgi@gmail.com>
# Contributor: Chris Clonch <chris at theclonchs dot com>
# Contributor: Justin Dray <justin@dray.be>

pkgname='chronograf-bin'
_pkgname='chronograf'
pkgver=1.10.0
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
sha256sums_x86_64=('0280576013ced715c2f5ca41b87b59b91a702bb42094eebc05cadea3c9d9be99')
sha256sums_i686=('dd2f68eecc714e69555e32863e8e5faa818777ddc1bec02b7be8eb6c3e499473')
sha256sums_armv7h=('b47508a487f26cd6e572c0140d6ec927433a8200802a8f11292c422429d9160e')
sha256sums_aarch64=('90a102f927bbc41f1000c430987e7cb002e6dcfab1431c1795673fa056339dd3')

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
