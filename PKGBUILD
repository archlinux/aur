# Maintainer: Phil Schaf <flying-sheep@web.de>

_pkgname=scanpy
pkgname=$_pkgname-git
pkgver=1.4+321.g5a2003a
pkgrel=1
pkgdesc='Single-Cell Analysis in Python'
arch=(any)
provides=(scanpy python-scanpy)
conflicts=(scanpy)
url='https://github.com/theislab/scanpy'
license=(BSD)
depends=(
	'python-anndata>=0.6.15'
	'python-matplotlib>=2.2'
	'python-pandas>=0.21'
	python-scipy
	python-seaborn
	python-h5py
	python-pytables
	'python-scikit-learn>=0.19.1'
	python-statsmodels
	python-patsy
	python-networkx
	python-natsort
	python-joblib
	'python-numba>=0.40.0'
)
optdepends=(
	'python-bbknn: Batch balanced KNN (batch correction)'
	'python-leidenalg: leiden community detection'
	'python-multicoretsne: Fast t-SNE'
	'python-louvain-igraph: Louvain clustering'
)
source=($_pkgname::git://github.com/theislab/scanpy.git)
md5sums=(SKIP)

pkgver() {
	cd "$srcdir/$_pkgname/$_pkgname"
	python -c 'import _version; print(_version.get_versions()["version"])'
}

build() {
	cd "$srcdir/$_pkgname"
	python setup.py build
}

package() {
	cd "$srcdir/$_pkgname"
	python setup.py install --prefix=/usr --root="$pkgdir" --optimize=1
}
