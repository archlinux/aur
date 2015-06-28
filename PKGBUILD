# Maintainer: Christian Hesse <mail@eworm.de>

pkgname=mysqltuner-git
pkgver=1.4.0.r0.g4f47252
pkgrel=1
pkgdesc="MySQLTuner - review configuration quickly and make adjustments to increase performance and stability - git checkout"
arch=('any')
url="http://www.mysqltuner.com"
license=('GPL')
makedepends=('git' 'markdown')
depends=('perl')
provides=(mysqltuner)
conflicts=(mysqltuner)
source=('mysqltuner::git://github.com/rackerhacker/MySQLTuner-perl.git')
sha256sums=('SKIP')

pkgver() {
	cd mysqltuner/

	if GITTAG="$(git describe --abbrev=0 --tags 2>/dev/null)"; then
		echo "$(sed -e "s/^${pkgname%%-git}//" -e 's/^[-_/a-zA-Z]\+//' -e 's/[-_+]/./g' <<< ${GITTAG}).r$(git rev-list --count ${GITTAG}..).g$(git log -1 --format="%h")"
	else
		echo "0.r$(git rev-list --count master).g$(git log -1 --format="%h")"
	fi
}

build() {
	cd mysqltuner/

	markdown README.md > README.html
}

package() {
	cd mysqltuner/

	install -D -m0755 mysqltuner.pl ${pkgdir}/usr/bin/mysqltuner
	install -D -m0644 LICENSE ${pkgdir}/usr/share/licenses/mysqltuner/LICENSE
	install -D -m0644 README.md ${pkgdir}/usr/share/doc/mysqltuner/README.md
	install -D -m0644 README.html ${pkgdir}/usr/share/doc/mysqltuner/README.html
}

