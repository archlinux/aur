# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=python-deepl
pkgver=1.4.0
pkgrel=2
pkgdesc="DeepL language translation API"
arch=('any')
url="https://github.com/deeplcom/deepl-python"
license=('MIT')
depends=('python-requests')
makedepends=('python-poetry-core' 'python-build' 'python-install')
checkdepends=('python-pytest')
install=deepl.install
changelog=CHANGELOG.md
source=("$pkgname-$pkgver.tar.gz::https://files.pythonhosted.org/packages/source/d/deepl/deepl-$pkgver.tar.gz")
sha256sums=('b3af9b3e44cbf9b100fef81ea5bd96dabe694ebc81bdb957e41cd6fd41ae3df2')
validpgpkeys=()

build() {
	cd "deepl-$pkgver"
	python -m build --wheel --skip-dependency-check --no-isolation
}

package() {
	export PYTHONHASHSEED=0
	cd "deepl-$pkgver"
	python -m install --optimize=1 --destdir="$pkgdir/" dist/*.whl
	install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
