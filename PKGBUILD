# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Maintainer: Guillaume Horel <guillaume.horel@gmail.com>

_pyname=fontParts
pkgname=python-${_pyname,,}
pkgver=0.10.7
pkgrel=1
pkgdesc='The replacement for RoboFab'
arch=(any)
url="https://github.com/robotools/${_pyname}"
license=(MIT)
_pydeps=(booleanoperations
         defcon
         fontmath
         fontpens # for defcon[pens]
         fonttools
         fs # for fonttools[ufo]
         lxml # for fonttools[lxml]
         unicodedata2) # for fonttools[unicode]
depends=(python
         "${_pydeps[@]/#/python-}")
makedepends=(python-{build,installer}
             python-setuptools-scm
             python-wheel)
_archive="$_pyname-$pkgver"
source=("https://files.pythonhosted.org/packages/source/${_pyname::1}/$_pyname/$_archive.zip")
sha256sums=('bb484a2362cb5805062154440a4e9be72ed42a0247531d88f11e50faa90ac5c8')

build() {
	cd "$_archive"
	python -m build -wn
}

check() {
	cd "$_archive/Lib"
	PYTHONPATH=. python "$_pyname/fontshell/test.py"
}

package() {
	cd "$_archive"
	python -m installer -d "$pkgdir" dist/*.whl
	install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE
}
