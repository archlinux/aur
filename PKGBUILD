# Maintainer: Luis Martinez <luis dot martinez at tuta dot io>
# Contributor: Andrew Sun <adsun701 at gmail dot com>
# Contributor: Aleksandar Trifunović <akstrfn at gmail dot com>
# Contributor: Sergey Mastykov <smastykov[at]gmail[dot]com>

pkgname=python-hupper
pkgver=1.10.3
pkgrel=2
pkgdesc="Integrated process monitor for developing servers"
arch=('any')
url="https://github.com/Pylons/hupper"
license=('MIT')
depends=('python')
makedepends=('python-setuptools')
checkdepends=('python-watchdog' 'python-pytest-cov' 'python-pytest-runner')
changelog=CHANGES.rst
source=("$pkgname-$pkgver.tar.gz::https://files.pythonhosted.org/packages/source/h/hupper/hupper-$pkgver.tar.gz")
sha256sums=('cd6f51b72c7587bc9bce8a65ecd025a1e95f1b03284519bfe91284d010316cd9')

build() {
	cd "hupper-$pkgver"
	python setup.py build
}

check() {
	cd "hupper-$pkgver"
	python setup.py pytest -v
}

package() {
	cd "hupper-$pkgver"
	python setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1 --skip-build
	install -Dm644 LICENSE.txt -t "$pkgdir/usr/share/licenses/$pkgname/"
}
