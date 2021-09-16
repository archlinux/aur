# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Dimitris Kiziridis <ragouel at outlook dot com>

pkgbase=python-cryptolyzer
pkgname=('python2-cryptolyzer' 'python-cryptolyzer')
pkgver=0.7.0
pkgrel=1
pkgdesc='Fast and flexible server cryptographic (TLS/SSL) settings analyzer library'
arch=('any')
url='https://gitlab.com/coroner/cryptolyzer'
license=('MPL2')
makedepends=('python-setuptools' 'python2-setuptools')
source=("$pkgbase-$pkgver.tar.gz::https://files.pythonhosted.org/packages/source/C/CryptoLyzer/CryptoLyzer-$pkgver.tar.gz")
sha256sums=('886f44dc7c2d50f46dd3df7532a0960135200ca34e54098df4e7cefa925b7846')

prepare() {
  cp -a "CryptoLyzer-$pkgver" "cryptolyzer-$pkgver-py2"
  mv "CryptoLyzer-$pkgver" "cryptolyzer-$pkgver"
}

build() {
  pushd "cryptolyzer-$pkgver"
  python setup.py build
  popd

  pushd "cryptolyzer-$pkgver-py2"
  python2 setup.py build
}

package_python-cryptolyzer() {
  depends=(
    'python-attrs>=19.1'
    'python-certvalidator' ## AUR
    'python-cryptoparser>=0.6.0' ## AUR
    'python-dateutil'
    'python-requests'
    'python-six'
    'python-urllib3')

  cd "cryptolyzer-${pkgver}"
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}

package_python2-cryptolyzer() {
  depends=(
    'python2-attrs>=19.1'
    'python2-certvalidator'
    'python2-cryptoparser>=0.6.0'
    'python2-enum34'
    'python2-ipaddress'
    'python2-dateutil'
    'python2-requests'
    'python2-six'
    'python2-typing'
    'python2-urllib3')

  cd "cryptolyzer-${pkgver}-py2"
  python2 setup.py install --root="$pkgdir" --optimize=1 --skip-build
}

# vim:set ts=2 sw=2 et:
