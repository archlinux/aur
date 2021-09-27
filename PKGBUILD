# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Kaizhao Zhang <zhangkaizhao@gmail.com>

_name=google-cloud-bigquery

pkgname=python-google-cloud-bigquery
pkgver=2.27.0
pkgrel=1
pkgdesc="Google BigQuery API client library"
arch=('any')
url="https://pypi.org/project/google-cloud-bigquery/"
license=('Apache')
depends=(
	'python>=3.6'
	'python-google-api-core>=1.29.0'
	'python-google-cloud-core>=1.4.1'
	'python-google-resumable-media>=0.6.0'
	'python-grpcio>=1.38.1'
	'python-packaging>=14.3'
	'python-proto-plus>=1.10.0'
	'python-protobuf>=3.12.0'
	'python-requests>=2.18.0')
makedepends=('python-setuptools')
optdepends=(
	'python-arrow>=1.0.0: for pyarrow support'
	'python-pandas>=0.23.0: for pandas support'
	'python-tqdm>=4.7.4: for tqdm support'
	'python-fastparquet: for fastparquet support'
	'python-snappy: for fastparquet support'
	'python-llvmlite: for fastparquet support')
source=("$pkgname-$pkgver.tar.gz::https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('98dd424093c3e2fbc515b69227872c86cd2ccec54f45c3333b382de70cc5a545')

build() {
	cd "$_name-$pkgver"
	python setup.py build
}

package() {
	cd "$_name-$pkgver"
	PYTHONHASHSEED=0 python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
	install -Dm644 README.rst "$pkgdir/usr/share/doc/$pkgname/README.rst"
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
