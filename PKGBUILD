# Maintainer: willemw <willemw12@gmail.com>

_pkgname=scanpy
pkgname=$_pkgname-git
pkgver=0.1+9.g8607c60
pkgrel=1
pkgdesc='Efficient tools for analyzing and simulating large-scale single-cell data'
arch=(any)
url='https://github.com/theislab/scanpy'
license=('GPL3')
depends=(
	cython
	python-matplotlib
	python-pandas
	python-scipy
	python-seaborn
	python-psutil
	python-xlrd
	python-h5py
	python-scikit-learn
	python-statsmodels
	python-natsort
	python-joblib
	python-profilehooks)
source=($_pkgname::git://github.com/theislab/scanpy.git)
md5sums=(SKIP)

pkgver() {
	cd "$srcdir/$_pkgname/$_pkgname"
	python -c 'import _version; print(_version.get_versions()["version"])'
}

build() {
	cd "$srcdir/$_pkgname"
	python setup.py build_ext
	python setup.py build
}

package() {
	cd "$srcdir/$_pkgname"
	python setup.py install --prefix=/usr --root="$pkgdir" --optimize=1
}
