# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=python-cryptolyzer
pkgver=0.8.0
pkgrel=1
pkgdesc='Fast and flexible server cryptographic (TLS/SSL) settings analyzer library'
arch=('any')
url='https://gitlab.com/coroner/cryptolyzer'
license=('MPL2')
depends=(
  'python-attrs'
  'python-certvalidator' ## AUR
  'python-cryptoparser' ## AUR
  'python-dateutil'
  'python-requests'
  'python-six'
  'python-urllib3')
makedepends=('python-setuptools')
changelog=CHANGELOG.md
source=("$pkgname-$pkgver.tar.gz::https://files.pythonhosted.org/packages/source/c/cryptolyzer/CryptoLyzer-$pkgver.tar.gz")
sha256sums=('fa82f408de355da029acf37a282a38cb50b2b46cbeb10f9c08a7d814072d26c0')

build() {
  cd "CryptoLyzer-$pkgver"
  python setup.py build
}

package() {
  export PYTHONHASHSEED=0
  cd "CryptoLyzer-$pkgver"
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
  install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}

# vim:set ts=2 sw=2 et:
