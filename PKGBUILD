# Maintainer: Yurii Kolesnykov <root@yurikoles.com>
# Contributor: Giovanni Harting <539@idlegandalf.com>
# Contributor: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>

pkgname=php-ioncube_loader
pkgver=12.0.4
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
sha256sums_i686=('a7ba0c6292b3ef75611f1265e0dbe94fa548026958a4a2a8718e7fcb19bb4464')
sha256sums_x86_64=('a9d31a0bc802f7cdb0066b298eed66c0b2163c5ceb28de6214afb96eececfb2b')
sha256sums_aarch64=('c043a643b80e0147bf98208c78de9d03428c537a48a181a7406d72f0e50f545a')

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
