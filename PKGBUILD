# Maintainer: András Wacha <awacha@gmail.com>
pkgname=sasmodels
#_name=${pkgname#python-}
pkgver=1.0.6
pkgrel=1
pkgdesc="Package for calculation of small angle scattering models using OpenCL."
arch=(x86_64)
url="https://github.com/SasView/sasmodels"
license=('BSD')
makedepends=( python-setuptools 
              python-sphinx 
	      texlive-core
	      texlive-bin
)
checkdepends=('python-pytest' )

depends=(
	python-numpy
	python-scipy
	python-docutils
	python-pyopencl
	python-bumps
	python-matplotlib
)
source=("https://github.com/SasView/${pkgname}/archive/v${pkgver}.tar.gz"  )
sha256sums=('9c64d602c4b5e479ff7fb56fff0d468e6cf363d620706703943c757745d2eae0')
build() {
	cd ${pkgname}-${pkgver}
	python setup.py build
#        #building the docs failed for version 1.0.6
#        (cd doc && make html SPHINXBUILD=sphinx-build)
}

#check() {
#	cd ${pkgname}-${pkgver}
#	python setup.py test
#}

package() {
	cd ${pkgname}-${pkgver}
	python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
#       # building the docs failed for version 1.0.6
#	mkdir -p ${pkgdir}/usr/share/doc/${pkgname}
#	cp ${srcdir}/${pkgname}-${pkgver}/doc/_build/html ${pkgdir}/usr/share/doc/${pkgname} -R
}
