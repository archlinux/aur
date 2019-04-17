# Maintainer: Matthew McGinn <mamcgi@gmail.com>
# Contributor: Chris Clonch <chris at theclonchs dot com>
# Contributor: Justin Dray <justin@dray.be>

pkgname='chronograf-bin'
_pkgname='chronograf'
pkgver='1.7.10'
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
sha256sums_x86_64=('7559fc0f1f2fee95353fe4e400dd6f3a5141c80c28b31fd2638c058f16eaee38')
sha256sums_i686=('54d5546659e81da3c649f4299db28a19a04e501dd08d1137e24a128ae4c48a9b')
sha256sums_armv7h=('94dad06c50d5d8f4f220db20e82569fc2aad6a21c8991bb0a814ab7d61986e30')
sha256sums_aarch64=('88572f1f4dbbd3ce0fd14a86ab849a9f8ef410ea934f9e696e9e79198da23730')

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
