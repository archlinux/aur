# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Dimitris Kiziridis <ragouel at outlook dot com>

pkgbase=python-cryptolyzer
pkgname=('python2-cryptolyzer' 'python-cryptolyzer')
pkgver=0.7.3
pkgrel=1
pkgdesc='Fast and flexible server cryptographic (TLS/SSL) settings analyzer library'
arch=('any')
url='https://gitlab.com/coroner/cryptolyzer'
license=('MPL2')
makedepends=('python-setuptools' 'python2-setuptools')
changelog=CHANGELOG.md
source=("$pkgbase-$pkgver.tar.gz::https://files.pythonhosted.org/packages/source/c/cryptolyzer/CryptoLyzer-$pkgver.tar.gz")
sha256sums=('b46faab6eb942501b583f9c919b8c6ac0890e7cbdab66efeeca5152933c55717')

prepare() {
  mv "CryptoLyzer-$pkgver" "cryptolyzer-$pkgver"
  cp -a "cryptolyzer-$pkgver" "cryptolyzer-$pkgver-py2"
}

build() {
  ( cd "cryptolyzer-$pkgver"
    python setup.py build )
  ( cd "cryptolyzer-$pkgver-py2"
    python2 setup.py build )
}

package_python-cryptolyzer() {
  depends=(
    'python-attrs'
    'python-certvalidator' ## AUR
    'python-cryptoparser' ## AUR
    'python-dateutil'
    'python-requests'
    'python-six'
    'python-urllib3')

  cd "cryptolyzer-${pkgver}"
  PYTHONHASHSEED=0 python setup.py install --root="$pkgdir" --optimize=1 --skip-build
  install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}

package_python2-cryptolyzer() {
  depends=(
    'python2-attrs'
    'python2-certvalidator'
    'python2-cryptoparser'
    'python2-enum34'
    'python2-ipaddress'
    'python2-dateutil'
    'python2-requests'
    'python2-six'
    'python2-typing'
    'python2-urllib3')

  cd "cryptolyzer-${pkgver}-py2"
  PYTHONHASHSEED=0 python2 setup.py install --root="$pkgdir" --optimize=1 --skip-build
}

# vim:set ts=2 sw=2 et:
