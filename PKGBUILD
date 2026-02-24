# Contributor: Ivan Batrakov <blackfan321 at disroot dot org>
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Aetf <aetf at unlimitedcodeworks dot xyz>

pkgname=python-coolname
pkgver=4.0.0
pkgrel=1
pkgdesc="Random Name and Slug Generator"
arch=('any')
url="https://github.com/alexanderlukanin13/coolname"
license=('BSD')
depends=('python')
makedepends=('python-build' 'python-installer' 'python-setuptools-scm')
checkdepends=('python-six' 'python-pytest')
source=("$pkgname-$pkgver.tar.gz::https://github.com/alexanderlukanin13/coolname/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('bac4dbd53d05c4e8097e8e771e97b84e7269375b63729013c74607cfc2d0516e')

build() {
	cd "coolname-$pkgver"
	export SETUPTOOLS_SCM_PRETEND_VERSION=$pkgver
	python -m build --wheel --no-isolation --skip-dependency-check
}

check() {
	cd "coolname-$pkgver"
	python -m venv --system-site-packages test-env
	test-env/bin/python -m installer dist/*.whl
	test-env/bin/python -m pytest
}

package() {
	cd "coolname-$pkgver"
	python -m installer --destdir="$pkgdir" dist/*.whl
	install -D LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
