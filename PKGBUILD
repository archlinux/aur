# Maintainer: Maximilian Stahlberg <maximilian.stahlberg tu-berlin de>
# Contributor: Feufochmar <feufochmar dot gd at gmail dot com>

pkgname=python-libtcod
pkgver=1.20.0
pkgrel=1
pkgdesc='Python Roguelike graphics/utility library.'
arch=('any')
url='https://github.com/libtcod/libtcod'
license=('BSD')
depends=('python' 'libtcod')
makedepends=('python-setuptools')
source=("https://github.com/libtcod/libtcod/archive/${pkgver}.tar.gz")
md5sums=('df1c2d8bca75a64aebe18194bb7e48f3')

package() {
	_pymajver="$(python -V | awk '{print $2}' | awk -F. '{print $1"."$2}')"

	cd "${srcdir}/libtcod-${pkgver}/python"
	python setup.py install --root=${pkgdir} --optimize=1

	# Link libtcod.so so the Python library finds it.
	cd "${pkgdir}/usr/lib/python${_pymajver}/site-packages/libtcodpy"
	ln -s ../../../libtcod.so .
}
