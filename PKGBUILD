# Maintainer: Christian Hesse <mail@eworm.de>

pkgname=claws-mail-plugin-reloader-git
pkgver=0.r5.g055cafb
pkgrel=1
pkgdesc='Claws-mail Plugin Reloader Plugin - git checkout'
arch=('i686' 'x86_64')
license=('GPL3')
url='http://www.claws-mail.org/'
depends=('claws-mail')
makedepends=('git')
conflicts=('claws-mail-plugin-reloader')
provides=('claws-mail-plugin-reloader')
source=('claws-mail-plugin-reloader::git://git.claws-mail.org/claws-mail-plugin-reloader.git')
sha256sums=('SKIP')

pkgver() {
	cd claws-mail-plugin-reloader/

	if GITTAG="$(git describe --abbrev=0 --tags 2>/dev/null)"; then
		echo "$(sed -e "s/^${pkgname%%-git}//" -e 's/^[-_/a-zA-Z]\+//' -e 's/[-_+]/./g' <<< ${GITTAG}).r$(git rev-list --count ${GITTAG}..).g$(git log -1 --format="%h")"
	else
		echo "0.r$(git rev-list --count master).g$(git log -1 --format="%h")"
	fi
}

build() {
	cd claws-mail-plugin-reloader/

	make
}

package() {
	cd claws-mail-plugin-reloader/

	make DESTDIR="${pkgdir}" PREFIX="/usr/" install
}

