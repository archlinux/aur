# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: P.J. Grochowski <pawel.grochowski.dev@gmail.com>

pkgname=kast
pkgver=1.1.1
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
makedepends=('python-setuptools')
source=("$pkgname-$pkgver.tar.bz2::$url/get/$pkgver.tar.bz2")
sha256sums=('c6b068f0ed6313052ee53d760ba8e73a361a17eb28e391852ce73b95d52c14b7')

prepare() {
	mv massultidev-kast-d678117baa23 "$pkgname-$pkgver"
}

build() {
	cd "$pkgname-$pkgver"
	python setup.py build
}

package() {
	export PYTHONHASHSEED=0
	cd "$pkgname-$pkgver"
	python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
	install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
