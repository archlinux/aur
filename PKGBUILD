# Maintainer: Specter119 <spcter119@gmail.com>

pkgname=python-language-tags
_name=${pkgname#python-}
_name=${_name//-/_}
pkgver=1.2.0
pkgrel=1
pkgdesc='This Python API offers a way to validate and lookup languages tags.'
arch=('any')
url='https://pypi.org/project/language-tags'
license=('MIT')
depends=('python>=3')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz"
        "https://raw.githubusercontent.com/OnroerendErfgoed/language-tags/master/LICENSE")
sha256sums=('e934acba3e3dc85f867703eca421847a9ab7b7679b11b5d5cfd096febbf8bde6'
         'SKIP')

build() {
	cd "$srcdir/${_name}-$pkgver"
	python setup.py clean --all
	python setup.py build
}

package() {
	cd "$srcdir/${_name}-$pkgver"
	python setup.py install --root "$pkgdir" --skip-build --optimize=1
	install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"
}
