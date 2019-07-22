# Maintainer: András Wacha <awacha@gmail.com>
pkgname=sasmodels
#_name=${pkgname#python-}
pkgver=1.0.0
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
	python-docutils
	python-pyopencl
	python-bumps
	python-matplotlib
)
source=("https://github.com/SasView/${pkgname}/archive/v${pkgver}.tar.gz"  )
sha256sums=('bb751d4a67d076df7485970a1c8c5050ccc18e088a0e0366d01c2eaaba292e1b')

build() {
	cd ${pkgname}-${pkgver}
	python setup.py build
        (cd doc && make html SPHINXBUILD=sphinx-build)
}

check() {
	cd ${pkgname}-${pkgver}
	python setup.py test
}

package() {
	cd ${pkgname}-${pkgver}
	python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
	mkdir -p ${pkgdir}/usr/share/doc/${pkgname}
	cp ${srcdir}/${pkgname}-${pkgver}/doc/_build/html ${pkgdir}/usr/share/doc/${pkgname} -R
}
