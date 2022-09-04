# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=python-sacrebleu
_pkg=sacrebleu
pkgver=2.2.0
pkgrel=1
pkgdesc='Reference BLEU implementation that auto-downloads test sets'
arch=('any')
url="https://github.com/mjpost/sacrebleu"
license=('Apache')
depends=(
	'python-colorama'
	'python-lxml'
	'python-numpy'
	'python-portalocker'
	'python-regex'
	'python-tabulate')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
changelog=CHANGELOG.md
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('bba309a6c4e9b480c13c15523a775df0237a644cdde3e14aac8e6b7414780d61')

build() {
	cd "$_pkg-$pkgver"
	python -m build --wheel --no-isolation
}

package() {
	cd "$_pkg-$pkgver"
	PYTHONHASHSEED=0 python -m installer --destdir="$pkgdir/" dist/*.whl
}
