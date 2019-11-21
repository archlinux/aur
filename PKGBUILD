# Maintainer: Maximilian Stahlberg <maximilian.stahlberg tu-berlin de>
# Contributor: Feufochmar <feufochmar dot gd at gmail dot com>

_name='libtcod'

pkgbase=python-libtcod
pkgname=(python-libtcod python2-libtcod)
pkgver=1.15.0
pkgrel=2
pkgdesc="Python Roguelike graphics/utility library"
arch=('any')
url='https://github.com/libtcod/libtcod'
license=('BSD')
depends=('libtcod')
makedepends=('python-setuptools' 'python2-setuptools')
source=("https://github.com/${_name}/${_name}/archive/${pkgver}.tar.gz")
md5sums=('514370f95c00464f23caed2358453ca7')

package_python-libtcod() {
	depends+=('python')

	cd "${srcdir}/${_name}-${pkgver}/python"

	python setup.py install --root=${pkgdir}

	# Link libtcod.so so the Python library finds it.
	pythonver="$(python -V)"
	cd "${pkgdir}/usr/lib/python${pythonver:7:3}/site-packages/${_name}py"
	ln -s ../../../libtcod.so .
}

package_python2-libtcod() {
	depends+=('python2')

	cd "${srcdir}/${_name}-${pkgver}/python"

	python2 setup.py install --root=${pkgdir}

	# Link libtcod.so so the Python library finds it.
	pythonver="$(python2 -V 2>&1)"
	cd "${pkgdir}/usr/lib/python${pythonver:7:3}/site-packages/${_name}py"
	ln -s ../../../libtcod.so .
}

