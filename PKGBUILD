# Maintainer: Guillaume Horel <guillaume.horel@gmail.com>
# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=python-defcon
_pyname=${pkgname#python-}
pkgver=0.10.1
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
makedepends=(python-{build,installer}
             python-setuptools-scm
             python-wheel)
checkdepends=(python-pytest)
optdepends=(python-fontpens
            'python-lxml: enables faster UFO parsing')
_archive="$_pyname-$pkgver"
source=("https://files.pythonhosted.org/packages/source/${_pyname::1}/$_pyname/$_archive.zip")
sha256sums=('fa7964f711b798e092e311f3a79e09fd5fa17bb1cd320d5a32015e4c54eb3070')

build() {
	cd "$_archive"
	python -m build -wn
}

check() {
	cd "$_archive"
	PYTHONPATH=Lib pytest Lib/defcon/test
}

package() {
	cd "$_archive"
	python -m installer -d "$pkgdir" dist/*.whl
	install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname/" License.txt
}
