# Maintainer: Caleb Maclennan <caleb@alerque.com>

_pipname=vttLib
pkgname=python-${_pipname,,}
pkgver=0.9.1.post2
pkgrel=1
pkgdesc='Dump, merge and compile Visual TrueType data in UFO3 with FontTools'
arch=('any')
url="https://github.com/daltonmaag/$_pipname"
license=('MIT')
_py_deps=('fonttools'
          'fs' # optdepends of fonttools required for [ufo]
          'pyparsing'
          'ufolib2')
depends=('python'
         "${_py_deps[@]/#/python-}")
makedepends=('python-setuptools')
# makedepends=('python-setuptools-scm')
source=("https://files.pythonhosted.org/packages/source/${_pipname::1}/$_pipname/$_pipname-$pkgver.zip")
# source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('23f99eaa988f96d6ad795ed84e8cdb75ecda57316d8a3342fc51ab92b08c64cc')

build() {
    cd "$_pipname-$pkgver"
    # echo "version = '$pkgver'" > "src/$_pipname/_version.py"
    python setup.py build
}

package() {
    cd "$_pipname-$pkgver"
    python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
