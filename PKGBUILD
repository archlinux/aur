# Maintainer: Christian Hesse <mail@eworm.de>

pkgname=easy-rsa-git
pkgver=3.0.0.rc2.r2.g171834d
pkgrel=1
pkgdesc="An easy-to-use, robust, and highly configurable VPN (Virtual Private Network) - git checkout"
arch=('i686' 'x86_64')
url="https://github.com/OpenVPN/easy-rsa"
depends=('openssl')
makedepends=('git')
conflicts=('easy-rsa' 'openvpn')
provides=('easy-rsa')
license=('custom')
source=('git://github.com/OpenVPN/easy-rsa.git')
sha256sums=('SKIP')

pkgver() {
	cd easy-rsa/

	if GITTAG="$(git describe --abbrev=0 --tags 2>/dev/null)"; then
		echo "$(sed -e "s/^${pkgname%%-git}//" -e 's/^[-_/a-zA-Z]\+//' -e 's/[-_+]/./g' <<< ${GITTAG}).r$(git rev-list --count ${GITTAG}..).g$(git log -1 --format="%h")"
	else
		echo "0.r$(git rev-list --count master).g$(git log -1 --format="%h")"
	fi
}

package() {
	cd easy-rsa/

	# doc and license
	install -d ${pkgdir}/usr/share/doc/easy-rsa/
	mv doc/* ${pkgdir}/usr/share/doc/easy-rsa/
	rmdir doc

	install -d ${pkgdir}/usr/share/licenses/easy-rsa/
	mv ChangeLog COPYING KNOWN_ISSUES ${pkgdir}/usr/share/licenses/easy-rsa/

	# Install easy-rsa
	install -d ${pkgdir}/usr/share/easy-rsa/
	mv * ${pkgdir}/usr/share/easy-rsa/
}

