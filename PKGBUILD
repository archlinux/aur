# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Marcell Meszaros < marcell.meszaros AT runbox.eu >

pkgname=python-crossplane
_pkg="${pkgname#python-}"
pkgver=0.5.7
pkgrel=2
pkgdesc='Reliable and fast NGINX configuration file parser and builder'
arch=('any')
url='https://github.com/nginxinc/crossplane'
license=('Apache')
depends=('python')
optdepends=('python-simplejson')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
checkdepends=('python-pytest')
source=("$pkgname-$pkgver.tar.gz::https://files.pythonhosted.org/packages/source/${_pkg::1}/$_pkg/$_pkg-$pkgver.tar.gz")
sha256sums=('a3d3ee1776bcccebf7a58cefeb365775374ab38bd544408117717ccd9f264f60')

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
}
