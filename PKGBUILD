# Maintainer: Guillaume Horel <guillaume.horel@gmail.com>
# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=python-defcon
_pyname=${pkgname#python-}
pkgver=0.10.0
pkgrel=1
pkgdesc='A set of UFO based objects for use in font editing applications'
arch=(any)
url="https://github.com/robotools/$_pyname"
license=(MIT)
_pydeps=(fonttools
         fs # for fonttools[ufo]
         unicodedata2) # for fonttools[unicode]
depends=(python
         "${_pydeps[@]/#/python-}")
makedepends=(python-setuptools-scm)
checkdepends=(python-pytest)
optdepends=(python-fontpens
            'python-lxml: enables faster UFO parsing')
_archive="$_pyname-$pkgver"
source=("https://files.pythonhosted.org/packages/source/${_pyname::1}/$_pyname/$_archive.zip")
sha256sums=('a009862a0bc3f41f2b1a1b1f80d6aeedb3a17ed77d598da09f5a1bd93e970b3c')

build() {
	cd "$_archive"
	python setup.py build
}

check() {
	cd "$_archive"
	PYTHONPATH=Lib pytest Lib/defcon/test
}

package() {
	cd "$_archive"
	python setup.py install --root="$pkgdir" --optimize=1 --skip-build
	install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname/" License.txt
}
