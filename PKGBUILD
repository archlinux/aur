# Maintainer: nochecksum <nochecksum at users dot noreply dot github dot com>
pkgname=gogs-openrc
pkgver=20151212b
pkgrel=2
pkgdesc="Gogs init scripts for OpenRC"
arch=('any')
url="https://aur.archlinux.org/packages/gogs-openrc/"
license=('APACHE')
groups=()
depends=('gogs' 'openrc')
source=('gogs.initd' 'gogs.confd')
sha1sums=('1da114fd8ab47b8387567e343176231e0e720b9b' '100e505266fcbc079c69e3cc28d285c2940db664')

package() {
	install -Dm755 ${srcdir}/gogs.confd "$pkgdir"/etc/conf.d/gogs
	install -Dm755 ${srcdir}/gogs.initd "$pkgdir"/etc/init.d/gogs
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
