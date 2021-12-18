# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Miguel de Val-Borro <miguel dot deval at gmail dot com>

pkgname=python-agnpy
pkgver=0.1.6
pkgrel=1
pkgdesc="Models Active Galactic Nuclei radiative processes"
arch=('any')
url="https://github.com/cosimonigro/agnpy"
license=('BSD')
depends=('python-astropy' 'python-numpy' 'python-matplotlib' 'python-scipy')
makedepends=('python-setuptools')
checkdepends=('python-pytest')
source=("$pkgname-$pkgver.tar.gz::https://files.pythonhosted.org/packages/source/a/agnpy/agnpy-$pkgver.tar.gz")
sha256sums=('454c52a19547e1a51a5c1704a618357df8f89308998df58092a1337429a4dcd5')

build() {
	cd "agnpy-$pkgver"
	python setup.py build
}

# check() {
# 	cd "agnpy-$pkgver"
# 	pytest -x
# }

package() {
	export PYTHONHASHSEED=0
	cd "agnpy-$pkgver"
	python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
	install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
	install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
