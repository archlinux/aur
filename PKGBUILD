# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: carstene1ns <arch carsten-teibes de> - http://git.io/ctPKG

pkgname=python-xmlformatter
pkgver=0.2.4
pkgrel=3
pkgdesc="Provides formatting of XML documents"
arch=('any')
url="https://github.com/pamoller/xmlformatter"
license=('MIT')
depends=('python')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
source=("$pkgname-$pkgver.tar.gz::https://pypi.python.org/packages/source/x/xmlformatter/xmlformatter-$pkgver.tar.gz")
sha256sums=('6d93c4bc04cffb1d4cf6eb9d9034018e9b264e4554269e7da67539ba4bff03f5')

build() {
	cd "xmlformatter-$pkgver"
	python -m build --wheel --no-isolation
}

package() {
	cd "xmlformatter-$pkgver"
	PYTHONHASHSEED=0 python -m installer --destdir="$pkgdir/" dist/*.whl
	install -Dm644 README.rst -t "$pkgdir/usr/share/doc/$pkgname/"
	local _site="$(python -c 'import site; print(site.getsitepackages()[0])')"
	install -d "$pkgdir/usr/share/licenses/$pkgname/"
	ln -s \
		"$_site/xmlformatter-$pkgver.dist-info/LICENSE.txt" \
		"$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
