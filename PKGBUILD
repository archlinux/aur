# Maintainer: Ke Liu <spcter119@gmail.com>

pkgname=python-language-tags
_name=${pkgname#python-}
_name=${_name//-/_}
pkgver=1.0.0
pkgrel=1
pkgdesc='Dealing with IANA language tags in Python.'
arch=('any')
url='https://pypi.org/project/language-tags'
license=('MIT')
depends=('python' 'python-six')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz"
        "https://raw.githubusercontent.com/OnroerendErfgoed/language-tags/master/LICENSE")
md5sums=('255ab209f923ffdf4a8f6b1bbae43f06'
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
