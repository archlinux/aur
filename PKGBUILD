# Maintainer: nochecksum <nochecksum at users dot noreply dot github dot com>
pkgname=gogs-openrc
pkgver=20151212
pkgrel=1
pkgdesc="Gogs init scripts for OpenRC"
arch=('any')
url="https://github.com/nochecksum/aur-gogs-openrc"
license=('APACHE')
groups=()
depends=('gogs' 'openrc')
makedepends=('git')
source=(git+git://github.com/nochecksum/aur-gogs-openrc#branch=master)
md5sums=('SKIP')

package() {
	cd "${srcdir}/aur-gogs-openrc"
	install -Dm755 gogs.confd "$pkgdir"/etc/conf.d/gogs
	install -Dm755 gogs.initd "$pkgdir"/etc/init.d/gogs
}

post_install() {
	echo " ==> Add Gogs to system startup wtih 'rc-update add gogs default'"
	echo " ==> Edit /etc/conf.d/gogs to change paths if required"
}

post_upgrade() {
	post_install "$1"
}

pre_remove() {
	echo " ==> Make sure to 'rc-update del gogs default'"
}
