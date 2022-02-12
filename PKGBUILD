# Maintainer: Yurii Kolesnykov <root@yurikoles.com>
# Contributor: Giovanni Harting <539@idlegandalf.com>
# Contributor: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>

pkgname=php-ioncube_loader
pkgver=11.0.1
_phpver=7.4
_php_name="php${_phpver%.*}"
pkgrel=1
pkgdesc="Loader for PHP files encoded with ionCube PHP Encoder"
arch=(i686 x86_64 aarch64)
url=http://www.ioncube.com/
license=(CUSTOM)
depends=(${_php_name})
_conf=etc/${_php_name}/conf.d/00-ioncube_loader.ini
backup=(${_conf})
source_i686=(ioncube_loader-i686-${pkgver}.tar.gz::https://downloads.ioncube.com/loader_downloads/ioncube_loaders_lin_x86.tar.gz)
source_x86_64=(ioncube_loader-x86_64-${pkgver}.tar.gz::https://downloads.ioncube.com/loader_downloads/ioncube_loaders_lin_x86-64.tar.gz)
source_aarch64=(ioncube_loader-aarch64-${pkgver}.tar.gz::https://downloads.ioncube.com/loader_downloads/ioncube_loaders_lin_aarch64.tar.gz)
sha256sums_i686=('f28a3433732969b63d4ada10e88a0f7341d639104b576b268fac17f46b4c8d63')
sha256sums_x86_64=('bbb87365a43a606f599de97d38eacf511648cc21fb84dad2c7cdb1e5f325f448')
sha256sums_aarch64=('2e6a09ea162821f79cf8d10c3095b304358b78ce57ab50175b49f59dec1dfb9d')

package() {
	cd ioncube

	install -dm0755 "$pkgdir/etc/$_php_name/conf.d"

	local _so_path="/usr/lib/$_php_name/modules/ioncube_loader.so"
	install -Dm0755 ioncube_loader_lin_$_phpver.so "$pkgdir/$_so_path"

	echo "zend_extension = $_so_path" > "$pkgdir/$_conf"

	install -Dm0644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE.txt"
	install -Dm0644 README.txt "$pkgdir/usr/share/doc/$pkgname/README.txt"
	install -Dm0644 USER-GUIDE.txt "$pkgdir/usr/share/doc/$pkgname/USER-GUIDE.txt"
}
