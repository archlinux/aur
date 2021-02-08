# Maintainer: Matthew McGinn <mamcgi@gmail.com>
# Contributor: Chris Clonch <chris at theclonchs dot com>
# Contributor: Justin Dray <justin@dray.be>

pkgname='chronograf-bin'
_pkgname='chronograf'
pkgver=1.8.10
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
sha256sums_x86_64=('3ce7f317d4f131c21977d8d4c44170c8e9bb5180605fbe8d11bc7b0bc4bd18b1')
sha256sums_i686=('88f7a100a4ed96b49f93781a3d23ea62c616c5e2a7b0f183e729e8870811f40d')
sha256sums_armv7h=('ec03c0295ea497d5c4ad9a2a8e474e98a099431db3499f8f7fa160743f520dcb')
sha256sums_aarch64=('2150dff91e216f0a97bde1e3a57e92213bd25de9b09af87b63f6fe9bff682b12')

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
