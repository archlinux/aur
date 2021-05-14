# Maintainer: Yurii Kolesnykov <root@yurikoles.com>
# Contributor: Giovanni Harting <539@idlegandalf.com>
# Contributor: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>

pkgname=php-ioncube_loader
pkgver=10.4.5
_phpver=7.4
_php_pkgver="${_phpver//./}"
_php_name="php${_php_pkgver}"
pkgrel=1
pkgdesc="Loader for PHP files encoded with ionCube PHP Encoder"
arch=(i686 x86_64)
url=http://www.ioncube.com/
license=(CUSTOM)
depends=(${_php_name})
_conf=etc/${_php_name}/conf.d/00-ioncube_loader.ini
backup=(${_conf})

source_i686=(ioncube_loader-i686-${pkgver}.tar.gz::https://downloads.ioncube.com/loader_downloads/ioncube_loaders_lin_x86.tar.gz)
source_x86_64=(ioncube_loader-x86_64-${pkgver}.tar.gz::https://downloads.ioncube.com/loader_downloads/ioncube_loaders_lin_x86-64.tar.gz)

sha256sums_i686=('d93ebaa9c6c8e555770e57022fc90692818871f7f83a8c81c615513ae31e47f3')
sha256sums_x86_64=('d7e0880e455310cda1c19762cd0d155cb8b7cac25ad2f906013764f8088c8a52')

package() {
	cd "${srcdir}"/ioncube

	install -dm0755 "${pkgdir}/etc/${_php_name}/conf.d"

	local _so_path="${pkgdir}/usr/lib/${_php_name}/modules/ioncube_loader.so"
	install -Dm0755 ioncube_loader_lin_${_phpver}.so "${_so_path}"        

	echo "zend_extension = ${_so_path}" > "${pkgdir}/${_conf}"

	install -Dm0644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.txt"

	for DOC in README.txt USER-GUIDE.txt
	do
		install -Dm0644 "${DOC}" "${pkgdir}/usr/share/doc/${pkgname}/${DOC}"
	done
}
