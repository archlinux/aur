# Contributor: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>
# Maintainer: Alexander Boyko <brdcom@ya.ru>
pkgname=activemq
pkgver=5.4.2
pkgrel=2
pkgdesc="Popular and powerful open source messaging and Integration Patterns provider"
arch=('x86_64')
url="http://activemq.apache.org"
license=('Apache 2.0')
depends=('java-runtime' 'lsb-release')
conflicts=('apache-activemq')
source=(ftp://bgbilling.ru/pub/bgbilling/activemq/linux/apache-${pkgname}-${pkgver}.tgz
	profile.sh
	profile.csh
	service)
options=(!strip)
install=install
md5sums=('cb732e4c0e64bc35b7d0088c078b1719'
         '4c934209808f54d70ef8314bc2966657'
         'a36634b281a3e8ce5a6ed5b85828bca2'
         '2dfc3365bae1927524d3cd409fcc77ef')

package() {
	install -dm0755 "${pkgdir}/opt"
	install -D -m0755 profile.sh "${pkgdir}/etc/profile.d/activemq.sh"
	install -D -m0755 profile.csh "${pkgdir}/etc/profile.d/activemq.csh"
	install -D -m0644 service "${pkgdir}/usr/lib/systemd/system/activemq.service"
	mv apache-${pkgname}-${pkgver} "${pkgdir}/opt/activemq"
	ln -s /opt/activemq/bin/linux-x86-64 "${pkgdir}/opt/activemq/bin/linux"
	rm -rf "${pkgdir}/opt/activemq/bin/macosx"
}
