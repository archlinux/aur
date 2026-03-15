# Maintainer: Agil Mammadov <mammadovagil@tutamail.com>
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Felix Golatofski <contact@xdfr.de>
# Contributor: mdraw.gh at gmail dot com

pkgname=python-markovify
_pkg="${pkgname#python-}"
pkgver=0.9.4
pkgrel=3
pkgdesc="Simple, extensible Markov chain generator"
arch=('any')
url='https://github.com/jsvine/markovify'
license=('MIT')
depends=('python' 'python-unidecode')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
checkdepends=('python-nose')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('c854b7a2600be322028a9f9deda58e54f3dd984f1828ee2dd19faaedbb79bb59')

build() {
	cd "$_pkg-$pkgver"
	python -m build --wheel --no-isolation
}

check() {
	cd "$_pkg-$pkgver"
	nosetests
}

package() {
	cd "$_pkg-$pkgver"
	python -m installer --destdir="$pkgdir" dist/*.whl
	install -Dm 644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
