# Maintainer: Giacomo Vercesi <mrjackv at hotmail dot it>
# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Caltlgin Stsodaat <contact@fossdaily.xyz>
# Contributor: Florian Wittmann

pkgname=python-mbstrdecoder
pkgver=1.1.0
pkgrel=2
pkgdesc='Multi-byte character string decoder'
arch=('any')
url='https://github.com/thombashi/mbstrdecoder'
license=('MIT')
depends=('python-chardet')
makedepends=('python-setuptools')
# checkdepends=(
#   'python-pytest'
#   'python-pytest-runner'
#   'python-pytest-md-report'
#   'python-faker')
source=("$pkgname-$pkgver.tar.gz::https://files.pythonhosted.org/packages/source/m/mbstrdecoder/mbstrdecoder-$pkgver.tar.gz"
        "$pkgname-$pkgver.tar.gz.asc::https://files.pythonhosted.org/packages/source/m/mbstrdecoder/mbstrdecoder-$pkgver.tar.gz.asc")
sha256sums=('f4dfd549e424ad8dfc985e6af8b55cb4ec0c208782f610d57439fe6a9a44c244'
            'SKIP')
validpgpkeys=('BCF9203E5E80B5607EAE6FDD98CDA9A5F0BFC367') ## Tsuyoshi Thombashi

build() {
  cd "mbstrdecoder-$pkgver"
  python setup.py build
}

## Cannot run tests due to circular dependencies
## python-pytest-md-report depends on this package
# check() {
#   cd "mbstrdecoder-$pkgver"
#   python setup.py pytest
# }

package() {
  cd "mbstrdecoder-$pkgver"
  PYTHONHASHSEED=0 python setup.py install --root="$pkgdir" --optimize=1 --skip-build
  install -Dm644 README.rst -t "$pkgdir/usr/share/doc/$pkgname"
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}

# vim: ts=2 sw=2 et:
