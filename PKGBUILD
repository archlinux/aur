# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Dimitris Kiziridis <ragouel at outlook dot com>

pkgbase=python-cryptolyzer
pkgname=('python2-cryptolyzer' 'python-cryptolyzer')
pkgver=0.7.1
pkgrel=2
pkgdesc='Fast and flexible server cryptographic (TLS/SSL) settings analyzer library'
arch=('any')
url='https://gitlab.com/coroner/cryptolyzer'
license=('MPL2')
makedepends=('python-setuptools' 'python2-setuptools')
source=("$pkgbase-$pkgver.tar.gz::https://files.pythonhosted.org/packages/source/c/cryptolyzer/cryptolyzer-$pkgver.tar.gz")
sha256sums=('624289a023b1e581792838f1e0737ab191e5f4cb505747f6d57bc9a38871e0e0')

prepare() {
  cp -a "cryptolyzer-$pkgver" "cryptolyzer-$pkgver-py2"
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
    'python-cryptoparser>=0.7.1' ## AUR
    'python-dateutil'
    'python-requests'
    'python-six'
    'python-urllib3')

  cd "cryptolyzer-${pkgver}"
  PYTHONHASHSEED=0 python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}

package_python2-cryptolyzer() {
  depends=(
    'python2-attrs>=19.1'
    'python2-certvalidator'
    'python2-cryptoparser>=0.7.1'
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
