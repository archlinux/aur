# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Caltlgin Stsodaat <contact@fossdaily.xyz>
# Contributor: Florian Wittmann

pkgname=python-typepy
pkgver=1.2.0
pkgrel=1
pkgdesc='Variable runtime type checker/validator/converter'
arch=('any')
url='https://github.com/thombashi/typepy'
license=('MIT')
depends=('python-mbstrdecoder>=1.0.0' 'python-mbstrdecoder<2')
makedepends=('python-setuptools')
optdepends=('python-dateutil' 'python-pytz')
checkdepends=('python-pytest-runner' 'python-tcolorpy' 'python-dateutil' 'python-pytz')
source=("$pkgname-$pkgver.tar.gz::https://files.pythonhosted.org/packages/source/t/typepy/typepy-$pkgver.tar.gz"
        "$pkgname-$pkgver.tar.gz.asc::https://files.pythonhosted.org/packages/source/t/typepy/typepy-$pkgver.tar.gz.asc")
sha256sums=('96b4c50151ffaca025b7202cdd4e84987ca058f4d6cf1aad0d9c82226961455e'
            'SKIP')
validpgpkeys=('BCF9203E5E80B5607EAE6FDD98CDA9A5F0BFC367')

build() {
  cd "typepy-$pkgver"
  python setup.py build
}

check() {
  cd "typepy-$pkgver"
  python setup.py pytest
}

package() {
  cd "typepy-$pkgver"
  PYTHONHASHSEED=0 python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
  install -Dm 644 README.rst -t "$pkgdir/usr/share/doc/$pkgname"
  install -Dm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}

# vim: ts=2 sw=2 et:
