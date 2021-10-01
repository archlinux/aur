# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Harley Wiltzer <harleyw@hotmail.com>

pkgname=python-omegaconf
pkgver=2.1.1
pkgrel=1
pkgdesc='Flexible Python configuration system'
arch=('any')
url='https://github.com/omry/omegaconf'
license=('BSD')
depends=('python-antlr4' 'python-pyaml>=5.1.0')
makedepends=('python-setuptools' 'java-runtime' 'python-pytest-runner' 'python-sphinx')
checkdepends=('python-pytest-mock')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('1c090255e303cd72af546fd6a433722edcd5ff30edf915405e6f56d28fb02b36')

build() {
	cd "omegaconf-$pkgver"
	python setup.py build
	cd docs
	PYTHONPATH=../ make man
}

check() {
	cd "omegaconf-$pkgver"
	python setup.py pytest
}

package() {
	cd "omegaconf-$pkgver"
	PYTHONHASHSEED=0 python setup.py install --root="$pkgdir" --optimize=1 --skip-build
	install -Dm 644 LICENSE DISCLAIMER -t "$pkgdir/usr/share/licenses/$pkgname/"
	install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
	install -Dm 644 docs/build/man/omegaconf.1 -t "$pkgdir/usr/share/man/man1/"
}
