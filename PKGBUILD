# Maintainer: Christian Hesse <mail@eworm.de>

pkgname=check_md_raid
pkgver=0.7.2
pkgrel=9
pkgdesc="Linux Software RAID Monitoring Plugin for Nagios"
arch=('any')
url="http://exchange.nagios.org/directory/Plugins/Operating-Systems/Linux/Linux-Software-Raid-Plugin-for-32-2Dbit-and-64-2Dbit-systems/details"
license=('GPL')
depends=('nagios' 'python2' 'mdadm')
optdepends=('sudo: check with non-root user')
source=("${pkgname}-${pkgver}.py::http://exchange.nagios.org/components/com_mtree/attachment.php?link_id=782&cf_id=24"
	'0001-use-python2.patch'
	'0002-strip-whitespace-from-state.patch'
	'0003-use-sudo-when-running-as-non-root-user.patch'
	'0004-make-checking-a-clean-state.patch'
	'sudo')
sha256sums=('b85f0a77215870839cb18a74d9e38b594eaeda5c44ddc88aff8d2c2246f506f7'
            '9721c32d4b8124f2db54f41574008018a605567e50a59eb9ffcd98e99ba8db98'
            '527d98535f4cda98a468ea69f6a3cfb3a53e27ecbd2affc553985be70e29125a'
            '6267ecf8aff1da308216675f94e9e91f91349ed3b1054b8c8c1dc4d08ef632ad'
            '542d756357f4e8afd16962015428efccabb9f4410c873556a2b8d6e0cc37ca69'
            '4882cf971684deb2afd6e1deb3883272dd41ed544576619f816498c6111c16cc')

build() {
	cp ${pkgname}-${pkgver}.py ${pkgname}
	patch -Np1 < ${srcdir}/0001-use-python2.patch
	patch -Np1 < ${srcdir}/0002-strip-whitespace-from-state.patch
	patch -Np1 < ${srcdir}/0003-use-sudo-when-running-as-non-root-user.patch
	patch -Np1 < ${srcdir}/0004-make-checking-a-clean-state.patch
}

package() {
	install -D -m 0755 ${srcdir}/${pkgname} ${pkgdir}/usr/lib/monitoring-plugins/${pkgname}

	install -d -m 0750 ${pkgdir}/etc/sudoers.d
	install -D -m 0440 ${srcdir}/sudo ${pkgdir}/etc/sudoers.d/check_md_raid
}

