# Maintainer: Manuel Hüsers <aur@huesers.de>
# Contributor: Iwan Timmer <irtimmer@gmail.com>
# Contributor: Timothée Ravier <tim at siosm dot fr>
# Contributor: Tom <reztho at archlinux dot org>

pkgname=tuned
pkgver=2.14.0
pkgrel=1
pkgdesc='Daemon that performs monitoring and adaptive configuration of devices in the system'
arch=('any')
url="https://github.com/redhat-performance/${pkgname}"
license=('GPL')
depends=('dbus-glib' 'ethtool' 'gawk' 'hdparm' 'polkit' 'python-configobj' 'python-dbus' 'python-decorator'  'python-gobject' 'python-linux-procfs' 'python-perf' 'python-pyudev' 'python-schedutils')
optdepends=('virt-what: For use with virtual machines' 'systemtap: Disk and net statistic monitoring systemtap scripts')
makedepends=('desktop-file-utils')
backup=('etc/tuned/active_profile')
install="${pkgname}.install"
source=("https://github.com/redhat-performance/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('2a36aea3115c7f50faf05b1a34218eeab6d61c808056cb6625cc20d0fcf2c74c')

package() {
	cd "${pkgname}-${pkgver}"

	make DESTDIR="${pkgdir}" install

	mv "${pkgdir}"/usr/sbin/* "${pkgdir}"/usr/bin/
	mv "${pkgdir}"/usr/libexec/tuned/* "${pkgdir}"/usr/lib/tuned/
	rm -r "${pkgdir}"/run "${pkgdir}"/usr/sbin "${pkgdir}"/usr/libexec

	install -Dm644 "${srcdir}/${pkgname}-${pkgver}/tuned.service" "${pkgdir}/usr/lib/systemd/system/tuned.service"
}
