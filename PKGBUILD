# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Maintainer: Caltlgin Stsodaat <contact@fossdaily.xyz>

pkgname=python-tcolorpy
pkgver=0.1.1
pkgrel=2
pkgdesc='Python library to apply true color for terminal text'
arch=('any')
url='https://github.com/thombashi/tcolorpy'
license=('MIT')
depends=('python>=3.6')
makedepends=('python-setuptools')
checkdepends=('python-pytest-runner')
source=("$pkgname-$pkgver.tar.gz::https://files.pythonhosted.org/packages/source/t/tcolorpy/tcolorpy-$pkgver.tar.gz"
        "$pkgname-$pkgver.tar.gz.asc::https://files.pythonhosted.org/packages/source/t/tcolorpy/tcolorpy-$pkgver.tar.gz.asc")
sha256sums=('33abe296af468582a2c4d4666761ee58a38935601699a61fb148f576cf648af8'
            'SKIP')
validpgpkeys=('BCF9203E5E80B5607EAE6FDD98CDA9A5F0BFC367')

build() {
  cd "tcolorpy-$pkgver"
  python setup.py build
}

check() {
  cd "tcolorpy-$pkgver"
  python setup.py pytest
}

package() {
  export PYTHONHASHSEED=0
  cd "tcolorpy-$pkgver"
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
  install -Dm644 README.rst -t "$pkgdir/usr/share/doc/$pkgname"
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}

# vim: ts=2 sw=2 et:
