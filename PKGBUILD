# Maintainer: Andre Schröder <andre.schroedr at gmail dot com>

# All my PKGBUILDs are managed at https://github.com/schra/pkgbuilds

_name=python-sphinx-math-dollar
pkgname=$_name
pkgver=1.2
_mainfolder=sphinx-math-dollar-$pkgver
pkgrel=2
pkgdesc='Sphinx extension to let you write LaTeX math using $$'
arch=(any)
url=https://github.com/sympy/sphinx-math-dollar
license=(MIT)
depends=(python)
makedepends=(python-setuptools)
source=($pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz)
sha256sums=('531c95d1fd07af06f48392ed7b9a67103636bcb34400cb9e2645a620cc0f417f')

build() {
  cd "$srcdir/$_mainfolder"
  python setup.py build
}

package() {
  cd "$srcdir/$_mainfolder"
  python setup.py install --root="$pkgdir/" --optimize=1 --skip-build

  # the setup.py also installs tests, thus remove them
  rm -R "$pkgdir"/usr/lib/python3.*/site-packages/sphinx_math_dollar/tests/
}
