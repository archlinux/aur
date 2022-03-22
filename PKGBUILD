# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=blacktex
pkgver=0.8.2
pkgrel=1
pkgdesc="LaTex code prettifier and formatter"
arch=('any')
url='https://pypi.org/project/blacktex'
license=('custom:proprietary')
depends=('python-pylatexenc' 'python-kgt' 'python-x21')
optdepends=('python-importlib-metadata: required for python<3.8')
makedepends=('python-setuptools' 'python-build' 'python-installer' 'python-wheel')
source=("$pkgname-$pkgver.tar.gz::https://files.pythonhosted.org/packages/source/b/$pkgname/$pkgname-$pkgver.tar.gz")
sha256sums=('387ce5e65162adc5f30b5b8055f7f89eabacce4018ccaf75417ff279dd22eca5')

build() {
	cd "$pkgname-$pkgver"
	python -m build --wheel --no-isolation
}

package() {
	export PYTHONHASHSEED=0
	cd "$pkgname-$pkgver"
	python -m installer --destdir="$pkgdir/" dist/*.whl
	install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
