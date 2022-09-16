# Maintainer: Philipp A. <flying-sheep@web.de>

pkgname=scanpy
pkgver=1.9.1
pkgrel=2
pkgdesc='Single-Cell Analysis in Python'
arch=(any)
provides=(scanpy python-scanpy)
url='https://github.com/theislab/scanpy'
license=(BSD)
depends=(
	'python-anndata>=0.7.4'
	'python-numpy>=1.17.0'
	'python-matplotlib>=3.4'
	'python-pandas>=1.0'
	'python-scipy>=1.4'
	python-seaborn
	python-h5py
	python-tqdm
	'python-scikit-learn>=0.21.2'
	'python-statsmodels>=0.10.0'
	python-patsy
	'python-networkx>=2.3'
	python-natsort
	python-joblib
	'python-numba>=0.41.0'
	'python-umap-learn>=0.3.10'
	python-packaging
	python-sinfo
)
optdepends=(
	'python-louvain-igraph: Louvain clustering'
	'python-leidenalg: leiden community detection'
	'python-bbknn: Batch balanced KNN (batch correction)'
	'python-rapids: GPU-driven calculation of neighbors'
	'python-magic-impute: MAGIC imputation method'
	'python-skmisc: For seurat_v3 highly_variable_genes method'
	'python-harmonypy: Harmony dataset integration algorithm'
	'python-scanorama: Scanorama dataset integration algorithm'
	'python-scrublet: Cell doublet detection'
)
makedepends=(python-flit-core python-setuptools-scm python-build python-installer python-wheel)
source=("https://files.pythonhosted.org/packages/source/${pkgname::1}/$pkgname/$pkgname-$pkgver.tar.gz")
sha256sums=('00c9a83b649da7e0171c91e9a08cff632102faa760614fd05cd4d1dbba4eb541')

build() {
	cd "$pkgname-$pkgver"
	# no idea why the dep check doesn’t work …
	python -m build --wheel --no-isolation --skip-dependency-check
}

package() {
	cd "$pkgname-$pkgver"
	python -m installer --destdir="$pkgdir" dist/*.whl
}
