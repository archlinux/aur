# Maintainer: Phil Schaf <flying-sheep@web.de>

_pkgname=scanpy
pkgname=$_pkgname-git
pkgver=0.2.3+2.g5624f7d
pkgrel=1
pkgdesc='Efficient tools for analyzing and simulating large-scale single-cell data'
arch=(any)
provides=(scanpy python-scanpy)
conflicts=(scanpy)
url='https://github.com/theislab/scanpy'
license=(GPL3)
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
	python-networkx
	python-igraph
	python-louvain-igraph
	python-natsort
	python-joblib
	python-profilehooks
	python-tqdm)
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
