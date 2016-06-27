# Maintainer: Christian Hesse <mail@eworm.de>
# Contributor: Mike Redd <mredd@0tue0.com>

pkgname=cmdln-git
pkgver=2.0.0.r1.g55e980c
pkgrel=1
pkgdesc='a Python module for easily building good multi-command scripts (an improved cmd.py)'
arch=('i686' 'x86_64')
url='http://github.com/trentm/cmdln'
license=('MIT')
depends=('python')
makedepends=('git')
provides=('cmdln')
source=('git://github.com/trentm/cmdln.git')
sha256sums=('SKIP')

pkgver() {
	cd cmdln/

	if GITTAG="$(git describe --abbrev=0 --tags 2>/dev/null)"; then
		printf '%s.r%s.g%s' \
			"$(sed -e "s/^${pkgname%%-git}//" -e 's/^[-_/a-zA-Z]\+//' -e 's/[-_+]/./g' <<< ${GITTAG})" \
			"$(git rev-list --count ${GITTAG}..)" \
			"$(git log -1 --format='%h')"
	else
		printf '0.r%s.g%s' \
			"$(git rev-list --count master)" \
			"$(git log -1 --format='%h')"
	fi
}


build() {
	cd cmdln/

	python setup.py build
}

package() {
	cd cmdln/

	python setup.py install --prefix="${pkgdir}"/usr
}
