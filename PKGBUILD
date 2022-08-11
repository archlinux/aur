# Maintainer: Guillaume Horel <guillaume.horel@gmail.com>
# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=python-defcon
_pyname=${pkgname#python-}
pkgver=0.10.2
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
sha256sums=('aee396e6d69e45ae65c8264781392d4c29116934b2737ad76d8230b40c182a44')

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
