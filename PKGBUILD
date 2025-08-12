# Maintainer: Philipp A. <flying-sheep@web.de>

pkgname=scanpy
pkgver=1.11.4
pkgrel=1
pkgdesc='Single-Cell Analysis in Python'
arch=(any)
provides=(scanpy python-scanpy)
url='https://github.com/theislab/scanpy'
license=(BSD)
depends=(
	'python-anndata>=0.8'
	'python-numpy>=1.24.1'
	'python-matplotlib>=3.7.5'
	'python-pandas>=1.5.3'
	'python-scipy>=1.8.1'
	'python-seaborn>=0.13.2'
	'python-h5py>=3.7'
	python-tqdm
	'python-scikit-learn>=1.1.3'
	'python-statsmodels>=0.14.5'
	'python-patsy>=1.0.1'
	'python-networkx>=2.7.1'
	python-natsort
	python-joblib
	'python-numba>=0.57.1'
	'python-umap-learn>=0.5.6'
	'python-pynndescent>=0.5.13'
	'python-packaging>=21.3'
	python-session-info2
	'python-legacy-api-wrap>=1.4.1'
)
optdepends=(
	'python-igraph: PAGA support (also transitively needed for Louvain/Leiden)'
	'python-louvain-igraph: Louvain clustering'
	'python-leidenalg: leiden community detection'
	'python-bbknn: Batch balanced KNN (batch correction)'
	'python-rapids: GPU-driven calculation of neighbors'
	'python-magic-impute: MAGIC imputation method'
	'python-skmisc: For seurat_v3 highly_variable_genes method'
	'python-harmonypy: Harmony dataset integration algorithm'
	'python-scanorama: Scanorama dataset integration algorithm'
	'python-scikit-image: Cell doublet detection with scrublet'
	'rapids-cudf: NVIDIA RAPIDS acceleration'
	'rapids-cuml: NVIDIA RAPIDS acceleration'
	'rapids-cugraph: NVIDIA RAPIDS acceleration'
	'python-dask: Dask parallelization'
)
makedepends=(python-hatch python-hatch-vcs python-build python-installer python-wheel)
source=("https://files.pythonhosted.org/packages/source/${pkgname::1}/$pkgname/$pkgname-$pkgver.tar.gz")
sha256sums=('333189ecac9c7009bf55d416ee2e272e1c490d54c719478f7b4dd1fc294d2f95')

build() {
	cd "$pkgname-$pkgver"
	python -m build --wheel --no-isolation
}

package() {
	cd "$pkgname-$pkgver"
	python -m installer --destdir="$pkgdir" dist/*.whl
}
