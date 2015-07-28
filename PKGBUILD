# Maintainer: Adrián Pérez de Castro <aperez@igalia.com>
pkgname='ledgerhub-hg'
pkgdesc='Import of financial data files for double-entry bookkeeping languages'
pkgver=r267.ccd537df98f1
pkgrel=1
arch=('any')
url="http://furius.ca/ledgerhub/"
license=('GPL')
source=("${pkgname}::hg+https://bitbucket.org/blais/ledgerhub/")
sha512sums=('SKIP')
depends=("beancount-hg" "python-beautifulsoup4")
makedepends=("mercurial")

pkgver () {
	cd "${pkgname}"
	printf "r%s.%s" "$(hg identify -n)" "$(hg identify -i)"
}

build () {
	cd "${pkgname}"
	# export CFLAGS='-std=gnu99'
	# python3 setup.py build_ext -i
	python3 setup.py build
}

package () {
	cd "${pkgname}"
	python3 setup.py install --prefix=/usr --root="${pkgdir}"
}
