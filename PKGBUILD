# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Andrew Sun <adsun701 at gmail dot com>
# Contributor: Aleksandar Trifunović <akstrfn at gmail dot com>
# Contributor: Sergey Mastykov <smastykov[at]gmail[dot]com>

pkgname=python-hupper
pkgver=1.10.3
pkgrel=3
pkgdesc="Integrated process monitor for developing servers"
arch=('any')
url="https://github.com/pylons/hupper"
license=('MIT')
depends=('python>=3.5')
makedepends=('python-setuptools')
checkdepends=('python-pytest-cov'
              'python-pytest-runner'
              'python-watchdog')
changelog=CHANGES.rst
source=("$pkgname-$pkgver.tar.gz::https://files.pythonhosted.org/packages/source/h/hupper/hupper-$pkgver.tar.gz"
        "$pkgname-$pkgver.tar.gz.asc::https://files.pythonhosted.org/packages/source/h/hupper/hupper-$pkgver.tar.gz.asc")
sha256sums=('cd6f51b72c7587bc9bce8a65ecd025a1e95f1b03284519bfe91284d010316cd9'
            'SKIP')
validpgpkeys=('CC1A48C957AC6ABEF05B2C596BC977B056B829E5')

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
