# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Andrea Feletto <andrea@andreafeletto.com>

pkgname=python-apng
_pkg="${pkgname#python-}"
pkgver=0.3.4
pkgrel=2
pkgdesc='Python module to deal with APNG files'
arch=('any')
url="https://github.com/eight04/pyapng"
license=('MIT')
depends=('python')
optdepends=('python-pillow')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('8982a12d8e3d7244a59e3543db6152bea16c25d03fa66a32d1dacd32b193bf8d')

build() {
	cd "pyAPNG-$pkgver"
	python -m build --wheel --no-isolation
}

package() {
	cd "pyAPNG-$pkgver"
	python -m installer --destdir="$pkgdir" dist/*.whl
	local _site="$(python -c 'import site; print(site.getsitepackages()[0])')"
	install -dv "$pkgdir/usr/share/licenses/$pkgname/"
	ln -sv "$_site/$_pkg-$pkgver.dist-info/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/"
}
