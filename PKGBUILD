# Maintainer: Christian Hesse <mail@eworm.de>

pkgname=grub-reboot-poweroff
pkgver=0.1.0.r2.g20d6bcc
pkgrel=2
pkgdesc='Reboot and Poweroff system from Grub boot menu'
arch=('any')
url="https://github.com/eworm-de/grub-reboot-poweroff"
license=('GPL')
depends=('grub')
makedepends=('git')
source=('git://github.com/eworm-de/grub-reboot-poweroff.git')

pkgver() {
	cd grub-reboot-poweroff/

	if GITTAG="$(git describe --abbrev=0 --tags 2>/dev/null)"; then
		echo "$(sed -e "s/^${pkgname%%-git}//" -e 's/^[-_/a-zA-Z]\+//' -e 's/[-_+]/./g' <<< ${GITTAG}).r$(git rev-list --count ${GITTAG}..).g$(git log -1 --format="%h")"
	else
		echo "0.r$(git rev-list --count master).g$(git log -1 --format="%h")"
	fi
}

package() {
	cd grub-reboot-poweroff/

	install -D -m0755 90_reboot ${pkgdir}/etc/grub.d/90_reboot
	install -D -m0755 91_poweroff ${pkgdir}/etc/grub.d/91_poweroff
}

sha256sums=('SKIP')
