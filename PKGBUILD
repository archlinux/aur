# Maintainer: Caleb Maclennan <caleb@alerque.com>

_pipname=vttLib
pkgname=python-${_pipname,,}
pkgver=0.9.0
pkgrel=1
pkgdesc='Dump, merge and compile Visual TrueType data in UFO3 with FontTools'
arch=('any')
url="https://github.com/daltonmaag/$_pipname"
license=('MIT')
_py_deps=('fonttools'
          'fs' # optdepends of fonttools required for [ufo]
          'lxml' # optdepends of fonttools required for [lxml]
          'pyparsing'
          'ufolib2')
depends=('python'
         "${_py_deps[@]/#/python-}")
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${_pipname::1}/$_pipname/$_pipname-$pkgver.zip")
sha256sums=('67f8cf9ca91042096fe35e47940f65ccddf39e19ea1ff777f1656666350aaa72')

prepare() {
    cd "$_pipname-$pkgver"
}

build() {
    cd "$_pipname-$pkgver"
    python setup.py build
}

package() {
    cd "$_pipname-$pkgver"
    python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
