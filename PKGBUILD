# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=python-normality
pkgver=2.2.3
pkgrel=1
pkgdesc='Micro-library for normalizing text strings'
license=('MIT')
arch=('any')
url='https://github.com/pudo/normality'
depends=('python-banal>=1.0.1' 'python-text-unidecode' 'python-chardet')
optdepends=('python-pyicu>=1.9.3: greatly improves text transliteration compared to python-text-unidecode')
makedepends=('python-setuptools')
checkdepends=('python-pytest' 'python-pyicu>=1.9.3')
# source=("https://files.pythonhosted.org/packages/source/${_module::1}/$_module/$_module-$pkgver.tar.gz")
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=('98bdc235cb069c18ec087f0866a2a82e3c8b992140f1fe3db95db9d202633fb3')

prepare() {
	cd "normality-$pkgver"
	sed -i '/packages=find_packages/s/test/tests*/' setup.py
}

build() {
	cd "normality-$pkgver"
	python setup.py build
}

check() {
	cd "normality-$pkgver"
	pytest
}

package() {
	cd "normality-$pkgver"
	PYTHONHASHSEED=0 python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
	install -Dm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
	install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
