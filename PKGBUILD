# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: P.J. Grochowski <pawel.grochowski.dev@gmail.com>

pkgname=kast
pkgver=1.1.2
pkgrel=1
pkgdesc="Video casting program"
arch=('any')
url="https://bitbucket.org/massultidev/kast"
license=('MIT')
depends=(
	'python-av'
	'python-bottle'
	'python-dataclasses-json'
	'python-mpris_server'
	'python-psutil'
	'python-pycaption'
	'python-pychromecast'
	'python-pyqt5'
	'python-pysubs2'
	'python-setproctitle'
	'python-tendo'
	'python-zeroconf')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
source=("$pkgname-$pkgver.tar.gz::https://files.pythonhosted.org/packages/source/k/$pkgname/$pkgname-$pkgver.tar.gz")
sha256sums=('fd171591a05f8cd76e910e5bf0777a86baddb2f92e5a3becf93328d14f568f89')

build() {
	cd "$pkgname-$pkgver"
	python -m build --wheel --no-isolation
}

package() {
	cd "$pkgname-$pkgver"
	python -m installer --destdir="$pkgdir" dist/*.whl
	local _site="$(python -c 'import site; print(site.getsitepackages()[0])')"
	install -dv "$pkgdir/usr/share/licenses/$pkgname/"
	ln -sv "$_site/$pkgname-$pkgver.dist-info/LICENSE.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

}
