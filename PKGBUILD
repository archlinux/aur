# Maintainer: Robin Broda <robin at broda dot me>

_pkgname=trachet
pkgname=${_pkgname}-git
pkgver=r313.cd2be17
pkgrel=1
pkgdesc='Tell you what is happening on your terminal'
arch=('any')
url="https://github.com/saitoha/${_pkgname}"
license=('GPL')
depends=('python2')
makedepends=('git' 'python2-setuptools')
source=("git+${url}"
        'git+https://github.com/saitoha/tff')
md5sums=('SKIP' 'SKIP')

pkgver() {
	cd "${_pkgname}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	cd "${_pkgname}"

	git submodule init
	git config submodule.trachet/tff.url ${srcdir}/tff
	git submodule update
}

build() {
	cd "${_pkgname}"

	python2 setup.py build
}

package() {
	cd "${_pkgname}"

	python2 setup.py install --root="${pkgdir}" --optimize=1 --skip-build
	echo -n > "${pkgdir}"/usr/lib/python2.7/site-packages/trachet-*-py2.7.egg-info/requires.txt
}
