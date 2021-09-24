# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Dimitris Kiziridis <ragouel at outlook dot com>

pkgbase=python-cryptoparser
pkgname=('python-cryptoparser' 'python2-cryptoparser')
pkgver=0.7.1
pkgrel=1
pkgdesc='Cryptographic protocol parser'
arch=('any')
url='https://gitlab.com/coroner/cryptoparser'
license=('MPL2')
makedepends=('python-setuptools' 'python2-setuptools')
source=("$pkgbase-$pkgver.tar.gz::https://files.pythonhosted.org/packages/source/c/cryptoparser/cryptoparser-$pkgver.tar.gz")
sha256sums=('594d28140f54ee25c7e3343af91ef46e818591168c5713031b907c166bd6b17e')

prepare() {
  cp -a "cryptoparser-$pkgver" "cryptoparser-$pkgver-py2"
}

build() {
  pushd "cryptoparser-$pkgver"
  python setup.py build
  popd

  pushd "cryptoparser-$pkgver-py2"
  python2 setup.py build
}

package_python-cryptoparser() {
  depends=('python-asn1crypto' 'python-attrs>=19.1' 'python-dateutil' 'python-six>=1.13')

  pushd "cryptoparser-$pkgver"
  PYTHONHASHSEED=0 python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}

package_python2-cryptoparser() {
  depends=('python2-asn1crypto' 'python2-attrs>=19.1' 'python2-dateutil' 'python2-enum34' 'python2-typing' 'python2-six>=1.13')

  pushd "cryptoparser-$pkgver-py2"
  PYTHONHASHSEED=0 python2 setup.py install --root="$pkgdir" --optimize=1 --skip-build
}

# vim:set ts=2 sw=2 et:
