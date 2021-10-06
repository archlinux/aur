# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: juantascon <juantascon.aur@horlux.org>

pkgname=python-pyral
pkgver=1.5.2
pkgrel=1
pkgdesc="Python Toolkit for Rally"
arch=('any')
url="https://github.com/RallyTools/RallyRestToolkitForPython"
license=("BSD")
depends=('python>=3.6' 'python-requests>=2.25.1' 'python-six')
makedepends=('python-setuptools' 'python-sphinx' 'python-sphinx_rtd_theme')
changelog=VERSIONS
source=("$pkgname-$pkgver.tar.gz::https://files.pythonhosted.org/packages/source/p/pyral/pyral-$pkgver.tar.gz")
sha256sums=('341575f25c2d208b11da0ee07919e863e464164a1eae3d6b87f183ce57c698f5')

build() {
	cd "pyral-$pkgver"
	python setup.py build
	cd doc
	make man
}

package() {
	cd "pyral-$pkgver"
	PYTHONHASHSEED=0 python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
	install -Dm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
	install -Dm 644 doc/build/man/pyral.1 -t "$pkgdir/usr/share/man/man1/"
}
