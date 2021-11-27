# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Caltlgin Stsodaat <contact@fossdaily.xyz>
# Contributor: Florian Wittmann

pkgname=python-mbstrdecoder
pkgver=1.1.0
pkgrel=1
pkgdesc='Multi-byte character string decoder'
arch=('any')
url='https://github.com/thombashi/mbstrdecoder'
license=('MIT')
depends=('python-chardet>=3.0.4')
makedepends=('python-setuptools')
# checkdepends=('python-pytest>=6.0.1' 'python-pytest-runner' 'python-faker>=1.0.2')
source=("$pkgname-$pkgver.tar.gz::https://files.pythonhosted.org/packages/source/m/mbstrdecoder/mbstrdecoder-$pkgver.tar.gz")
sha256sums=('f4dfd549e424ad8dfc985e6af8b55cb4ec0c208782f610d57439fe6a9a44c244')

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
