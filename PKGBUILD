# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Maintainer: Caltlgin Stsodaat <contact@fossdaily.xyz>

pkgname=python-tcolorpy
pkgver=0.1.2
pkgrel=1
pkgdesc='Python library to apply true color for terminal text'
arch=('any')
url='https://github.com/thombashi/tcolorpy'
license=('MIT')
depends=('python')
makedepends=('python-setuptools' 'python-build' 'python-installer' 'python-wheel')
checkdepends=('python-pytest')
source=("$pkgname-$pkgver.tar.gz::https://files.pythonhosted.org/packages/source/t/tcolorpy/tcolorpy-$pkgver.tar.gz"
        "$pkgname-$pkgver.tar.gz.asc::https://files.pythonhosted.org/packages/source/t/tcolorpy/tcolorpy-$pkgver.tar.gz.asc")
sha256sums=('8a669c29aada6e6715048ae04116e6b620f0864541fecb8722ede568f403b76e'
            'SKIP')
validpgpkeys=('BCF9203E5E80B5607EAE6FDD98CDA9A5F0BFC367')

build() {
  cd "tcolorpy-$pkgver"
  python -m build --wheel --no-isolation
}

check() {
  cd "tcolorpy-$pkgver"
  PYTHONPATH=./ pytest -x --disable-warnings
}

package() {
  export PYTHONHASHSEED=0
  cd "tcolorpy-$pkgver"
  python -m installer --destdir="$pkgdir/" dist/*.whl
  install -Dm644 README.rst -t "$pkgdir/usr/share/doc/$pkgname"
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}

# vim: ts=2 sw=2 et:
