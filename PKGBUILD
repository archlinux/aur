# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=python-sacrebleu
_pkg="${pkgname#python-}"
pkgver=2.3.1
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
# checkdepends=('python-pytest')
changelog=CHANGELOG.md
source=("$pkgname-$pkgver.tar.gz::https://files.pythonhosted.org/packages/source/s/$_pkg/$_pkg-$pkgver.tar.gz"
        'setup.py.patch')
sha256sums=('7969b294f15dae84d80fb2b76d30c83b245f49f4ecb1cac79acb553eb93cb537'
            'f1c476ca26f36cdf55cad6c4452c3a9d84ff7b962b17e28a7c2a622753f6ced7')

prepare() {
	patch -p1 -d "$_pkg-$pkgver" < setup.py.patch
}

build() {
	cd "$_pkg-$pkgver"
	python -m build --wheel --no-isolation
}

# check() {
# 	cd "$_pkg-$pkgver"
# 	PYTHONPATH="$PWD" pytest -x
# }

package() {
	cd "$_pkg-$pkgver"
	python -m installer --destdir="$pkgdir/" dist/*.whl
}
