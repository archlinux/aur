# Maintainer: Aseem Athale <athaleaseem@gmail.com>
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Philip Goto <philip.goto@gmail.com>

pkgname=python-wasabi
_pkg="${pkgname#python-}"
pkgver=1.1.2
pkgrel=1
pkgdesc='Lightweight console printing and formatting toolkit'
arch=('any')
url='https://github.com/explosion/wasabi'
license=('MIT')
depends=('python')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
checkdepends=('python-pytest')
source=("$pkgname-$pkgver.tar.gz::https://files.pythonhosted.org/packages/source/w/$_pkg/$_pkg-$pkgver.tar.gz")
sha256sums=('1aaef3aceaa32edb9c91330d29d3936c0c39fdb965743549c173cb54b16c30b5')

prepare() {
	cd "$_pkg-$pkgver"
#	sed -i '/packages=/c\packages=["wasabi"],' setup.py
}

build() {
	cd "$_pkg-$pkgver"
	python -m build --wheel --no-isolation
}

check() {
	cd "$_pkg-$pkgver"
	pytest -x
}

package() {
	cd "$_pkg-$pkgver"
	PYTHONHASHSEED=0 python -m installer --destdir="$pkgdir" dist/*.whl
#	local _site="$(python -c 'import site; print(site.getsitepackages()[0])')"
	install -d "$pkgdir/usr/share/licenses/$pkgname/"
	ln -s "$_site/$_pkg-$pkgver.dist-info/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/"
}
