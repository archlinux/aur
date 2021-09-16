# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Submitter: Nbiba Bedis <bedisnbiba@gmail.com>

pkgname=python-ansimarkup
pkgver=1.5.0
pkgrel=1
pkgdesc='Produce colored terminal text with an xml-like markup'
arch=('any')
url='https://github.com/gvalkov/python-ansimarkup'
license=('BSD')
depends=('python-colorama')
makedepends=('python-setuptools')
checkdepends=('python-pytest>=3.0.3' 'python-pytest-runner' 'python-pytest-cov>=2.3.1')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('c7b1b26128ce9111ce33458e297de3872e88f88f638f73b7427a0369706d1c2f')

build() {
	cd "$pkgname-$pkgver"
	python setup.py build
}

check() {
	cd "$pkgname-$pkgver"
	python setup.py pytest
}

package() {
	cd "$pkgname-$pkgver"
	PYTHONHASHSEED=0 python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
	install -Dm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
	install -Dm 644 README.rst -t "$pkgdir/usr/share/doc/$pkgname/"
}
