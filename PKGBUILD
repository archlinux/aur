# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Kaizhao Zhang <zhangkaizhao@gmail.com>

pkgname=python-google-cloud-bigquery
pkgver=2.34.1
pkgrel=1
pkgdesc="Google BigQuery API client library"
arch=('any')
url="https://github.com/googleapis/python-bigquery"
license=('Apache')
depends=(
	'python-dateutil'
	'python-google-api-core'
	'python-google-cloud-core'
	'python-google-resumable-media'
	'python-grpcio'
	'python-packaging'
	'python-proto-plus'
	'python-protobuf'
	'python-requests')
makedepends=(
	'python-setuptools'
	'python-build'
	'python-installer'
	'python-wheel'
	'python-sphinx'
	'python-recommonmark'
	'ipython')
optdepends=(
	'ipython'
	'python-arrow: pyarrow support'
	'python-pandas: pandas support'
	'python-tqdm: tqdm support'
	'python-fastparquet: fastparquet support'
	'python-snappy: fastparquet support'
	'python-llvmlite: fastparquet support')
changelog=CHANGELOG.md
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('84314803eb7e8ebc4effe7e8960019e0993498a46d26121dd97fbe91960604f6')

build() {
	cd "python-bigquery-$pkgver"
	python -m build --wheel --no-isolation
	cd docs
	PYTHONPATH=../ sphinx-build -b man ./ _build
}

package() {
	export PYTHONHASHSEED=0
	cd "python-bigquery-$pkgver"
	python -m installer --destdir="$pkgdir/" dist/*.whl
	install -Dm644 README.rst -t "$pkgdir/usr/share/doc/$pkgname/"
	install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
	install -Dm644 docs/_build/google-cloud-bigquery.1 -t "$pkgdir/usr/share/man/man1/"
}
