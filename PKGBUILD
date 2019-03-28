# Maintainer: Chris Oelmueller <chris.oelmueller@gmail.com>
_pythonname=deepdiff
pkgname=python-${_pythonname}
pkgver=4.0.2
pkgrel=1
pkgdesc="Deep Difference of dictionaries, iterables, strings and other objects. It will recursively look for all the changes."
arch=('any')
url="https://github.com/seperman/${_pythonname}"
license=('MIT')
depends=('python' 'python-jsonpickle' 'python-orderedset')
optdepends=('python-mmh3: murmurhash3 for faster hashing')
source=("https://pypi.io/packages/source/d/${_pythonname}/${_pythonname}-${pkgver}.tar.gz")
sha1sums=('10990b97fb3da4a8873c50e92f0dde3b08bb9750')
sha256sums=('f263bf42d3b4eaac8359100f59497e98ae40ea256402b9c75e8c20add9fdbdb0')
sha512sums=('06ba3ff0b6d105d7dd1d6c8551aa04ca19652f064ff52602bb1a67f4301a6858439b16f2bc72a4969fa042108db2f722e248fb3f65ee71fd586fe698a214fff4')

prepare() {
  cd "$srcdir/${_pythonname}-${pkgver}"
  sed -i 's@ordered_set@orderedset@' "${_pythonname}/base.py"
  sed -i 's@ordered_set@orderedset@' "${_pythonname}/diff.py"
  sed -i 's@ordered_set@orderedset@' "${_pythonname}/helper.py"
  sed -i 's@ordered_set@orderedset@' "${_pythonname}/model.py"
}

build() {
  cd "$srcdir/${_pythonname}-${pkgver}"
  python setup.py build
}

package() {
  cd "$srcdir/${_pythonname}-${pkgver}"
  python setup.py install --root="$pkgdir/" --prefix="/usr" --optimize=1
}

