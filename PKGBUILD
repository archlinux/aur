# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Sascha Shaw <sascha.shaw@t-online.de>

pkgname=python-odfpy-git
_pkg=odfpy
pkgver=1.4.2.r1.g574f0fa
pkgrel=1
pkgdesc='Python API and tools to manipulate OpenDocument files'
arch=('any')
url='https://github.com/eea/odfpy/'
license=('GPL' 'Apache')
depends=('python-defusedxml')
makedepends=('git' 'python-build' 'python-installer' 'python-setuptools' 'python-wheel')
checkdepends=('python-pytest')
source=("$_pkg::git+$url")
sha256sums=('SKIP')

pkgver() {
	git -C "$_pkg" describe --long --tags | sed 's/^release-//;s/-/.r/;s/-/./'
}

build() {
	cd "$_pkg"
	python -m build --wheel --no-isolation
}

check() {
	cd "$_pkg"
	PYTHONPATH="$PWD" pytest -x
}

package() {
	cd "$_pkg"
	PYTHONHASHSEED=0 python -m installer --destdir="$pkgdir" dist/*.whl
}
