# Maintainer: Dimitris Kiziridis <ragouel at outlook dot com>

pkgbase=python-cryptolyzer
pkgname=('python2-cryptolyzer' 'python-cryptolyzer')
pkgver=0.3.1
pkgrel=1
pkgdesc='Fast and flexible server cryptographic (TLS/SSL) settings analyzer library for Python 2.7/3.4+ with CLI'
arch=('any')
url='https://gitlab.com/coroner/cryptolyzer'
license=('MPL2')
conflicts=('python2-cryptolyzer-git' 'python-cryptolyzer-git')
makedepends=('python-setuptools' 'python2-setuptools')
source=("cryptolyzer-${pkgver}.tar.gz::https://files.pythonhosted.org/packages/fc/87/4058ec84584656bb0c3792a04a2badbf601690c219b442cf6bd8a518aed2/cryptolyzer-0.3.1.tar.gz")
sha256sums=('6e34659fdcfbabab2181fec7f07833ebfa6b19f3ef5c4f213ed4fcde95686a37')

build_python-cryptolyzer() {
  cd "cryptolyzer-${pkgver}"
  python setup.py build
}

build_python2-cryptolyzer() {
  cd "cryptolyzer-${pkgver}"
  python2 setup.py build
}

package_python-cryptolyzer() {
  depends=('python-cryptography'
           'python-urllib3'
           'python-six'
           'python-cryptoparser')
  cd "cryptolyzer-${pkgver}"
  _pythonversion=$(python --version | awk -F ' ' '{print substr($2, 1, length($2)-2)}')
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
  cp -avR cryptolyzer "${pkgdir}/usr/lib/python${_pythonversion}/site-packages/"
}

package_python2-cryptolyzer() {
  depends=('python2-cryptography'
           'python2-urllib3'
           'python2-six'
           'python2-cryptoparser'
           'python-enum-compat')
  cd "cryptolyzer-${pkgver}"
  _pythonversion=$(python2 --version | awk -F ' ' '{print substr($2, 1, length($2)-2)}')
  python2 setup.py install --root="$pkgdir" --optimize=1 --skip-build
  cp -avR cryptolyzer "${pkgdir}/usr/lib/python2.7/site-packages/"
}
# vim:set ts=2 sw=2 et:
