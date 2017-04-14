# Maintainer: Josef Hopfgartner <josef@netzagentur.at>

pkgname=libzbxmodbus-git
_pkgname=libzbxmodbus
pkgver=20161101.aa2a57f
pkgrel=1
pkgdesc='Zabbix Modbus loadable module'
url='https://share.zabbix.com/dir-libraries/zabbix-loadable-modules/modbus-loadable-module'
license=('GPL2.0')
arch=('i686' 'x86_64')
makedepends=('git' 'make' )
depends=('zabbix-server' 'libmodbus-dev')
provides=(libzbxmodbus)
conflicts=(libzbxmodbus)
install=
source=('git://github.com/v-zhuravlev/libzbxmodbus.git')
md5sums=('SKIP')

pkgver() {
	cd "${srcdir}/${_pkgname}"
	git log -1 --format='%cd.%h' --date=short | tr -d -
}

build() {
	cd "${srcdir}/${_pkgname}"
	autoreconf --install --symlink --force
	./configure --enable-zabbix-3.2 --prefix=/usr
	make
}

package() {
	cd "${srcdir}/${_pkgname}"
	make DESTDIR="${pkgdir}" install
}
