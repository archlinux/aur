# Maintainer: amadejpapez <contact@amadejpapez.com>

pkgname=python-name-that-hash
_pkgname=name-that-hash
pkgver=1.10.0
pkgrel=3
pkgdesc="The Modern Hash Identification System."
arch=("any")
url="https://github.com/HashPals/Name-That-Hash"
license=("GPL3")
depends=("python" "python-click" "python-rich")
makedepends=("python-setuptools" "python-dephell")
source=("https://files.pythonhosted.org/packages/source/${_pkgname::1}/$_pkgname/$_pkgname-$pkgver.tar.gz")
sha256sums=("aabe1a3e23f5f8ca1ef6522eb1adcd5c69b5fed3961371ed84a22fc86ee648a2")

prepare() {
    cd "${_pkgname}-${pkgver}"
    dephell deps convert --from pyproject.toml --to setup.py
}

build() {
	cd "$_pkgname-$pkgver"
	python setup.py build
}

package() {
	cd "$_pkgname-$pkgver"
	python setup.py install --prefix="/usr" --root="$pkgdir/" --optimize=1 --skip-build
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
