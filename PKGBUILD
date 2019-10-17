# Maintainer: András Wacha <awacha@gmail.com>
pkgname=python-bumps
_name=${pkgname#python-}
pkgver=0.7.13
pkgrel=1
pkgdesc="Data fitting with uncertainty analysis"
arch=(any)
url="https://github.com/bumps/bumps"
license=('custom')
makedepends=( python-setuptools 
              python-sphinx 
              python-nose 
              python-docutils
              python-pygments
              'python-jinja>=2'
)
depends=( python-numpy
	  python-scipy
          python-matplotlib
	  python-wxpython
          python-pyparsing
          python-periodictable
          python-scikit-learn
)
source=("https://github.com/${_name}/${_name}/archive/v${pkgver}.tar.gz" 
	"bumps.patch")
sha256sums=('f0c368d7beb4307297fb5298658921941a80c21e7bc52fb5dab1a1d1ef16d250'
	    'SKIP')
sha256sums=('c7070b55bdcb3ebb3bdb4242092c1f9c68ad8d7ecfe0990cd80b849d9f80f0a7'
            'SKIP')

prepare() {
	cd ${_name}-${pkgver}
#	patch -p1 <../bumps.patch
}

build() {
	cd ${_name}-${pkgver}
	python setup.py build
	(cd bumps/dream && cc compiled.c -I ../../Random123/include/ -O2 -fopenmp -shared -lm -o _compiled.so -fPIC )
#        (cd doc && make html)
#	(cd doc && make pdf)
}

check() {
	cd ${_name}-${pkgver}
#	python test.py
}

package() {
	cd ${_name}-${pkgver}
	python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
#	mkdir -p ${pkgdir}/usr/share/licenses/python-bumps
#	cp ${srcdir}/${_name}-${pkgver}/LICENSE.txt ${pkgdir}/usr/share/licenses/python-bumps/license.txt
#	mkdir -p ${pkgdir}/usr/share/doc/python-bumps
#	cp ${srcdir}/${_name}-${pkgver}/doc/_build/html ${pkgdir}/usr/share/doc/python-bumps -R
}
