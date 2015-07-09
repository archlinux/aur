# Maintainer: Adrian Perez <aperez@igalia.com>
pkgname='beancount-hg'
pkgdesc='Double-Entry Accounting from Text Input'
pkgver=r2826.59cf47a2800a
pkgrel=1
arch=('i686' 'x86_64')
url="http://furius.ca/beancount/"
license=('GPL')
source=("${pkgname}::hg+https://bitbucket.org/blais/beancount/")
sha1sums=('SKIP')
depends=('python-dateutil' 'python>=3.3' 'python-ply' 'python-dateutil')
makedepends=('mercurial')
optdepends=('python-bottle: For the "beancount web" web-based interface')

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
