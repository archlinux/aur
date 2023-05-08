# Maintainer: András Wacha <awacha@gmail.com>
pkgname=sasmodels
#_name=${pkgname#python-}
pkgver=1.0.7
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
sha256sums=('fdf26b0d8c36f25f6abf92cbabaeaa53a9975b64182ec5cf3d134f681ab5fd3d')
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
