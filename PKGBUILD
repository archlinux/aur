# Maintainer: Adrian Perez <aperez@igalia.com>
pkgname='beancount-hg'
pkgdesc='Double-Entry Accounting from Text Input'
pkgver=r2586.dbba632103c9
pkgrel=1
arch=('any')
url="http://furius.ca/beancount/"
license=('GPL')
source=("${pkgname}::hg+https://bitbucket.org/blais/beancount/")
sha1sums=('SKIP')
depends=('python-dateutil')
makedepends=('mercurial')

# TODO: Add python-cdecimal when package is available
depends=(
	python-bottle
	wget
)

pkgver () {
	cd "${pkgname}"
	printf "r%s.%s" "$(hg identify -n)" "$(hg identify -i)"
}

build () {
	cd "${pkgname}"
	export CFLAGS='-std=gnu99'
	python3 setup.py build_ext -i
	python3 setup.py build
}

package () {
	cd "${pkgname}"
	python3 setup.py install --prefix=/usr --root="${pkgdir}"
}
