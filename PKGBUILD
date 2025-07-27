# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=python-sacrebleu
_pkg="${pkgname#python-}"
pkgver=2.5.0
pkgrel=2
pkgdesc='Reference BLEU implementation that auto-downloads test sets'
arch=('any')
url="https://github.com/mjpost/sacrebleu"
license=('Apache-2.0')
depends=(
	'python-colorama'
	'python-lxml'
	'python-numpy'
	'python-portalocker'
	'python-regex'
	'python-tabulate')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
checkdepends=('python-pytest')
changelog=CHANGELOG.md
source=("$pkgname-$pkgver.tar.gz::https://github.com/mjpost/$_pkg/archive/refs/tags/v$pkgver.zip")
sha256sums=('e7276ac39e2857554314abfadce554dcc6828a2c2c4639b2e2f1b753b2a7126a')

build() {
	SETUPTOOLS_SCM_PRETEND_VERSION=$pkgver python -m build -nw "$_pkg-$pkgver"
}

check() {
	cd "$_pkg-$pkgver"
	PYTHONPATH="$PWD" pytest -x
}

package() {
    cd "$_pkg-$pkgver"
    install -Dm 644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    python -m installer --compile-bytecode=1 --destdir="$pkgdir/" dist/*.whl
}
