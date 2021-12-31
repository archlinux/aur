# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=python-april
pkgver=2.0.1
pkgrel=1
pkgdesc="Simplified data deserialization"
license=('MIT')
arch=('any')
url="https://github.com/cosven/april"
depends=('python')
makedepends=('python-setuptools')
source=(
	"$pkgname-$pkgver.tar.gz::https://files.pythonhosted.org/packages/source/a/april/april-$pkgver.tar.gz"
	"LICENSE::$url/raw/master/LICENSE")
sha256sums=('1e0fd23e81e27fe57c627b7c00684064741e8cad526f082fe4e252bb5e1d411d'
            '94a5aefbfdad95b8d38124aa1cc81f7aaac503dae8e8963b5f9568c5da079bb2')

build() {
	cd "april-$pkgver"
	python setup.py build
}

package() {
	export PYTHONHASHSEED=0
	cd "april-$pkgver"
	python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
	install -Dm644 "$srcdir/LICENSE" -t "$pkgdir/usr/share/licenses/$pkgname/"
}
