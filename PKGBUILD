# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Caltlgin Stsodaat <contact@fossdaily.xyz>
# Contributor: Florian Wittmann

pkgname=python-mbstrdecoder
pkgver=1.0.1
pkgrel=2
pkgdesc='Multi-byte character string decoder'
arch=('any')
url='https://github.com/thombashi/mbstrdecoder'
license=('MIT')
depends=('python-chardet>=3.0.4')
makedepends=('python-setuptools')
# checkdepends=('python-pytest>=6.0.1' 'python-pytest-runner' 'python-faker>=1.0.2')
source=("$pkgname-$pkgver.tar.gz::https://files.pythonhosted.org/packages/source/m/mbstrdecoder/mbstrdecoder-$pkgver.tar.gz"
        "$pkgname-$pkgver.tar.gz.asc::https://files.pythonhosted.org/packages/source/m/mbstrdecoder/mbstrdecoder-$pkgver.tar.gz.asc")
sha256sums=('f895e1fb97496855ab5e43de99588787169c01f782c71625142d1a62729e9f9d'
            'SKIP')
validpgpkeys=('BCF9203E5E80B5607EAE6FDD98CDA9A5F0BFC367')

build() {
  cd "mbstrdecoder-$pkgver"
  python setup.py build
}

## pytest pulls unneeded dependencies from pip just to run unit tests...
# check() {
#   cd "mbstrdecoder-$pkgver"
#   python setup.py pytest
# }

package() {
  cd "mbstrdecoder-$pkgver"
  PYTHONHASHSEED=0 python setup.py install --root="$pkgdir" --optimize=1 --skip-build
  install -Dm 644 README.rst -t "$pkgdir/usr/share/doc/$pkgname"
  install -Dm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}

# vim: ts=2 sw=2 et:
