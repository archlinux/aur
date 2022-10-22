# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Sebastian Weiss <dl3yc at darc dot de>

pkgname=python-polt
_pkg="${pkgname#python-}"
pkgver=1.0.0
pkgrel=1
pkgdesc="Python library to monitor and control user input devices"
arch=('any')
url="https://gitlab.com/nobodyinperson/python3-polt"
license=('GPL3')
depends=(
	'python-click'
	'python-matplotlib'
	'python-numpy'
	'python-setuptools'
	'python-scipy'
	'python-xdgspec')
makedepends=('python-build' 'python-installer' 'python-wheel')
source=("$pkgname-$pkgver.tar.gz::https://files.pythonhosted.org/packages/source/${_pkg::1}/$_pkg/$_pkg-$pkgver.tar.gz")
sha256sums=('7f69f52ae1e1407b33f2efc79a5cb44b8f5c3d034f764a0d665cbcd18216dc9b')

build() {
	cd "$_pkg-$pkgver"
	python -m build --wheel --no-isolation
}

package() {
	cd "$_pkg-$pkgver"
	PYTHONHASHSEED=0 python -m installer --destdir="$pkgdir" dist/*.whl
}
