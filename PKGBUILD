# Maintainer: András Wacha <awacha@gmail.com>
pkgname=sasview
pkgver=5.0.4
pkgrel=1
pkgdesc=""
arch=(x86_64)
url="https://sasview.org"
license=('BSD')
depends=( python-setuptools 
          python-pyparsing 
          python-html5lib 
          python-reportlab 
          python-h5py 
          python-lxml 
          python-pillow 
          python-pylint
          python-periodictable
          python-bumps
          python-numpy
          python-scipy
          python-pyqt5
          python-matplotlib
          python-xhtml2pdf
          python-sphinx
          python-pyopencl
          python-ipykernel
          ipython
          jupyter
          python-twisted
	  python-qt5reactor
	  python-service-identity
          python-pytest
	  sasmodels
)
checkdepends=(python-unittest-xml-reporting)

makedepends=()
source=("$pkgname-$pkgver.tar.gz::https://github.com/SasView/sasview/archive/v${pkgver}.tar.gz")
md5sums=('bd43ab43e5fc6a4a1ea4a8f44277147a')

build() {
	cd "$pkgname-$pkgver"
	python setup.py build
	python setup.py build_sphinx
}

#check() {
#	cd "$pkgname-$pkgver"
#	python setup.py test
#}

package() {
	cd "$pkgname-$pkgver"
	mkdir -p ${pkgdir}/usr/share/doc/sasview/tutorials
	cp ${srcdir}/${pkgname}-${pkgver}/docs/sasview/*.pdf ${pkgdir}/usr/share/doc/sasview/tutorials/
	cp -R ${srcdir}/${pkgname}-${pkgver}/build/sphinx/html ${pkgdir}/usr/share/doc/sasview/
	python setup.py install --root="$pkgdir/" --optimize=1
	
}
