# Contributor: Johannes Löthberg <johannes@kyriasis.com>
_base=pylibmc
pkgname=python-${_base}-git
pkgver=r598.4cda09a
pkgrel=1
pkgdesc="Quick and small memcached client for Python"
url="https://github.com/lericson/${_base}"
arch=(any)
license=('custom:BSD-3-clause')
depends=(python libmemcached)
makedepends=(python-setuptools git)
source=(git+${url}.git)
sha512sums=('SKIP')
provides=(python-${_base})
conflicts=(python-${_base})

pkgver() {
	cd ${_base}
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd ${_base}
	export PYTHONHASHSEED=0
	python setup.py build
}

package() {
	cd ${_base}
	PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1 --skip-build
	install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
