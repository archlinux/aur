# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Kaizhao Zhang <zhangkaizhao@gmail.com>

pkgname=python-google-cloud-bigquery
pkgver=2.30.1
pkgrel=1
pkgdesc="Google BigQuery API client library"
arch=('any')
url="https://github.com/googleapis/python-bigquery"
license=('Apache')
depends=(
	'python>=3.6'
	'python-dateutil>=2.7.2'
	'python-google-api-core>=1.29.0'
	'python-google-cloud-core>=1.4.1'
	'python-google-resumable-media>=0.6.0'
	'python-grpcio>=1.38.1'
	'python-packaging>=14.3'
	'python-proto-plus>=1.10.0'
	'python-protobuf>=3.12.0'
	'python-requests>=2.18.0')
makedepends=('python-setuptools' 'python-sphinx' 'python-recommonmark')
optdepends=(
	'python-arrow>=3.0.0: pyarrow support'
	'python-pandas>=0.24.2: pandas support'
	'python-tqdm>=4.7.4: tqdm support'
	'python-fastparquet: fastparquet support'
	'python-snappy: fastparquet support'
	'python-llvmlite: fastparquet support')
changelog=CHANGELOG.md
source=("$pkgname-$pkgver.tar.gz::https://github.com/googleapis/python-bigquery/archive/v$pkgver.tar.gz")
sha256sums=('11b35a342fb1f10964fe7b987891eb8b4c5aa50c08e4aa00e02a5dcfe393ea07')

build() {
	cd "python-bigquery-$pkgver"
	python setup.py build
	cd docs
	PYTHONPATH=../ sphinx-build -b man ./ _build
}

package() {
	cd "python-bigquery-$pkgver"
	PYTHONHASHSEED=0 python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
	install -Dm 644 README.rst -t "$pkgdir/usr/share/doc/$pkgname/"
	install -Dm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
	install -Dm 644 docs/_build/google-cloud-bigquery.1 -t "$pkgdir/usr/share/man/man1/"
}
