# Maintainer:  Adam Brenner <adam@aeb.io>
# Contributor: Yurii Kolesnykov <root@yurikoles.com>
# Contributor: Giovanni Harting <539@idlegandalf.com>
# Contributor: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>

pkgname=php-ioncube_loader
pkgver=12.0.5
_phpver=8.1
#_php_name="php${_phpver%.*}"
_php_name=php
pkgrel=1
pkgdesc="Loader for PHP files encoded with ionCube PHP Encoder"
arch=(i686 x86_64 aarch64)
url=http://www.ioncube.com/
license=(CUSTOM)
depends=("${_php_name}")
_conf="etc/${_php_name}/conf.d/00-ioncube_loader.ini"
backup=("${_conf}")
source_i686=("ioncube_loader-i686-${pkgver}.tar.gz::https://downloads.ioncube.com/loader_downloads/ioncube_loaders_lin_x86.tar.gz")
source_x86_64=("ioncube_loader-x86_64-${pkgver}.tar.gz::https://downloads.ioncube.com/loader_downloads/ioncube_loaders_lin_x86-64.tar.gz")
source_aarch64=("ioncube_loader-aarch64-${pkgver}.tar.gz::https://downloads.ioncube.com/loader_downloads/ioncube_loaders_lin_aarch64.tar.gz")
sha256sums_i686=('2fbf7255c9117b5dc3be8e506dbdddb03f26922786f61317a4423c6b0b41d32d')
sha256sums_x86_64=('c4d6d65d19909c9029b928b19c1f982a47fb33d2c7834a6a1c9babe861ef55f6')
sha256sums_aarch64=('bcfe4ab3ed095c74097c01d19021b12de2a6f08b626cb86b9e2bfb3770f5a40e')

package() {
	cd ioncube

	install -dm0755 "${pkgdir}/etc/${_php_name}/conf.d"

	local _so_path="/usr/lib/${_php_name}/modules/ioncube_loader.so"
	install -Dm0755 "ioncube_loader_lin_${_phpver}.so" "${pkgdir}/${_so_path}"

	echo "zend_extension = ${_so_path}" > "${pkgdir}/${_conf}"

	install -Dm0644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.txt"
	install -Dm0644 README.txt "${pkgdir}/usr/share/doc/${pkgname}/README.txt"
	install -Dm0644 USER-GUIDE.txt "${pkgdir}/usr/share/doc/${pkgname}/USER-GUIDE.txt"
}
