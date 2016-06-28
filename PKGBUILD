# Maintainer: Christian Hesse <mail@eworm.de>
# Contributor: Mike Redd <mredd@0tue0.com>

pkgbase=python-cmdln-git
pkgname=(python-cmdln-git python2-cmdln-git)
pkgver=2.0.0.r1.g55e980c
pkgrel=4
pkgdesc='a Python module for easily building good multi-command scripts - git checkout'
arch=('i686' 'x86_64')
url='http://github.com/trentm/cmdln'
license=('MIT')
depends=('python')
makedepends=('git' 'python2')
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

package_python-cmdln-git() {
	depends=('python')
	provides=('python-cmdln')
	conflicts=('python-cmdln')

	cd cmdln/

	python setup.py build

	python setup.py install --prefix="${pkgdir}"/usr
}

package_python2-cmdln-git() {
	depends=('python2')
	provides=('python2-cmdln')
	conflicts=('python2-cmdln')

	cd cmdln/

	python2 setup.py build

	python2 setup.py install --prefix="${pkgdir}"/usr
}
