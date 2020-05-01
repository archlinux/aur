# Maintainer: Matthew McGinn <mamcgi@gmail.com>
# Contributor: Chris Clonch <chris at theclonchs dot com>
# Contributor: Justin Dray <justin@dray.be>

pkgname='chronograf-bin'
_pkgname='chronograf'
pkgver=1.8.4
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
source=("${_pkgname}.install")
sha256sums=('1252f86f1e249be19eec4f7fe388300fb5f8d1cad5603b2ea87ea07362dc8768')
sha256sums_x86_64=('2eb481bc8c5d85bc5006bffc375cad8d8bcff67283c222451acfc2e6eb4f80be')
sha256sums_i686=('15fb6265d39b5626500e6fc478a0ca144ecd12d932f989524f3ab93bb73a0b6a')
sha256sums_armv7h=('c3bf3918d0b5ed73903e2312c8294696a33aba722db2665fb9c57cd06c8a19dd')
sha256sums_aarch64=('20f208d6f62d75747b60905e8db1a8e0d9fe58694a52f9cde806c6ccc05c8294')

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
