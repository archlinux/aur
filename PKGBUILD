# Maintainer: Christian Hesse <mail@eworm.de>

pkgname=mkinitcpio-ykfde-git
pkgver=0.5.0.r15.g06fc9a2
pkgrel=1
pkgdesc="Full disk encryption with Yubikey (Yubico key) - git checkout"
arch=('i686' 'x86_64')
url="https://github.com/eworm-de/mkinitcpio-ykfde"
license=('GPL')
conflicts=('mkinitcpio-ykfde')
provides=('mkinitcpio-ykfde')
depends=('yubikey-personalization' 'cryptsetup' 'iniparser' 'libarchive')
makedepends=('git' 'markdown')
install=mkinitcpio-ykfde.install
source=('git://github.com/eworm-de/mkinitcpio-ykfde.git')
sha256sums=('SKIP')
backup=('etc/ykfde.conf')

pkgver() {
	cd mkinitcpio-ykfde/

	if GITTAG="$(git describe --abbrev=0 --tags 2>/dev/null)"; then
		echo "$(sed -e "s/^${pkgname%%-git}//" -e 's/^[-_/a-zA-Z]\+//' -e 's/[-_+]/./g' <<< ${GITTAG}).r$(git rev-list --count ${GITTAG}..).g$(git log -1 --format="%h")"
	else
		echo "0.r$(git rev-list --count master).g$(git log -1 --format="%h")"
	fi
}

build() {
	cd mkinitcpio-ykfde/

	make
}

package() {
	cd mkinitcpio-ykfde/

	make DESTDIR=${pkgdir} install-mkinitcpio
}

