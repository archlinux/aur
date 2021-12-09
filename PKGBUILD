# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Harley Wiltzer <harleyw@hotmail.com>

pkgname=python-omegaconf
pkgver=2.1.1
pkgrel=2
pkgdesc='Flexible Python configuration system'
arch=('any')
url='https://github.com/omry/omegaconf'
license=('BSD')
depends=('python-antlr4' 'python-pyaml')
makedepends=('python-setuptools' 'java-runtime' 'python-pytest-runner' 'python-sphinx')
# checkdepends=('python-pytest-mock')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('1c090255e303cd72af546fd6a433722edcd5ff30edf915405e6f56d28fb02b36')

build() {
	cd "omegaconf-$pkgver"
	python setup.py build
	cd docs
	PYTHONPATH=../ make man
}

# check() {
# 	cd "omegaconf-$pkgver"
# 	pytest -x
# }

package() {
	export PYTHONHASHSEED=0
	cd "omegaconf-$pkgver"
	python setup.py install --root="$pkgdir" --optimize=1 --skip-build
	install -Dm644 LICENSE DISCLAIMER -t "$pkgdir/usr/share/licenses/$pkgname/"
	install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
	install -Dm644 docs/build/man/omegaconf.1 -t "$pkgdir/usr/share/man/man1/"
}
