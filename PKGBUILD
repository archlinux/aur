# Maintainer: Maximilian Stahlberg <maximilian.stahlberg tu-berlin de>
# Contributor: Feufochmar <feufochmar dot gd at gmail dot com>

_name='libtcod'
_importname='libtcodpy'
pkgbase=('python-libtcod')
pkgname=('python-libtcod' 'python2-libtcod')
pkgver=1.6.6
pkgrel=1
pkgdesc="Python Roguelike graphics/utility library"
arch=('any')
url="https://bitbucket.org/libtcod/libtcod"
license=('BSD')
depends=('libtcod')
makedepends=('mercurial' 'python-setuptools' 'python2-setuptools')
source=("hg+https://bitbucket.org/$_name/$_name#tag=$pkgver")
md5sums=('SKIP')

package_python-libtcod() {
	depends+=('python')

	cd "${srcdir}/${_name}/python"

	python setup.py install --root=${pkgdir}

	# Link libtcod.so so the Python library finds it.
	pythonver="$(python -V)"
	cd "${pkgdir}/usr/lib/python${pythonver:7:3}/site-packages/${_name}py"
	ln -s ../../../libtcod.so .
}

package_python2-libtcod() {
	depends+=('python2')

	cd "${srcdir}/${_name}/python"

	python2 setup.py install --root=${pkgdir}

	# Link libtcod.so so the Python library finds it.
	pythonver="$(python2 -V 2>&1)"
	cd "${pkgdir}/usr/lib/python${pythonver:7:3}/site-packages/${_name}py"
	ln -s ../../../libtcod.so .
}

