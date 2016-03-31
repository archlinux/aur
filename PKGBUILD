# Maintainer: Christian Hesse <mail@eworm.de>

pkgname=mkinitcpio-chkeymap
pkgver=0.1.0.r3.g5e3f039
pkgrel=2
pkgdesc='Set keymap and timezone for main system inside initrd'
arch=('any')
makedepends=('git')
url='https://github.com/eworm-de/mkinitcpio-chkeymap'
license=('GPL')
install=mkinitcpio-chkeymap.install
backup=('etc/vconsole.conf'
	'etc/X11/xorg.conf.d/00-keyboard.conf')
source=('git://github.com/eworm-de/mkinitcpio-chkeymap.git')
sha256sums=('SKIP')

pkgver() {
	cd mkinitcpio-chkeymap/

	if GITTAG="$(git describe --abbrev=0 --tags 2>/dev/null)"; then
		echo "$(sed -e "s/^${pkgname%%-git}//" -e 's/^[-_/a-zA-Z]\+//' -e 's/[-_+]/./g' <<< ${GITTAG}).r$(git rev-list --count ${GITTAG}..).g$(git log -1 --format="%h")"
	else
		echo "0.r$(git rev-list --count master).g$(git log -1 --format="%h")"
	fi
}

package() {
	cd mkinitcpio-chkeymap/

	install -D -m0644 hook/chkeymap ${pkgdir}/usr/lib/initcpio/hooks/chkeymap
	install -D -m0644 install/chkeymap ${pkgdir}/usr/lib/initcpio/install/chkeymap

	install -D -m0644 etc/vconsole.conf ${pkgdir}/etc/vconsole.conf
	install -D -m0644 etc/00-keyboard.conf ${pkgdir}/etc/X11/xorg.conf.d/00-keyboard.conf
}

