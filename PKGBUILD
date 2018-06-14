# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Gordian Edenhofer <gordian.edenhofer[at]yahoo[dot]de>

pkgbase=python-acme
pkgname=('python-acme' 'python2-acme')
pkgver=0.25.1
pkgrel=1
pkgdesc="ACME protocol implementation in Python"
arch=('any')
license=('Apache')
url="https://github.com/certbot/certbot"
makedepends=('python-setuptools' 'python2-setuptools' 'python-pyopenssl' 'python2-pyopenssl'
             'python-pyrfc3339' 'python2-pyrfc3339' 'python-pytz' 'python2-pytz' 'python-requests'
             'python2-requests' 'python-six' 'python2-six' 'python-josepy' 'python2-josepy'
             'python-mock' 'python2-mock' 'python-requests-toolbelt' 'python2-requests-toolbelt')
checkdepends=('python-pytest-runner' 'python2-pytest-runner')
source=("https://pypi.io/packages/source/a/acme/acme-$pkgver.tar.gz")
sha512sums=('8d07e53af45a2f5a8f12f23fc914519e1dc12b25066cb5f314fe8882e05746f9f849c51ac1fdc9b13f7c9efb6de25d1953dc3e37ee0590a454aa1bcd88163f65')

prepare() {
  cp -a acme-$pkgver{,-py2}
}

build() {
  cd "$srcdir"/acme-$pkgver
  python setup.py build

  cd "$srcdir"/acme-$pkgver-py2
  python2 setup.py build
}

check() {
  cd "$srcdir"/acme-$pkgver
  python setup.py pytest

  cd "$srcdir"/acme-$pkgver-py2
  python2 setup.py pytest
}

package_python-acme() {
  depends=('python-setuptools' 'python-pyopenssl' 'python-pyrfc3339' 'python-pytz' 'python-requests'
           'python-six' 'python-josepy' 'python-mock' 'python-requests-toolbelt')

  cd acme-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1
}

package_python2-acme() {
  depends=('python2-setuptools' 'python2-pyopenssl' 'python2-pyrfc3339' 'python2-pytz'
           'python2-requests' 'python2-six' 'python2-josepy' 'python2-mock'
           'python2-requests-toolbelt')

  cd acme-$pkgver-py2
  python2 setup.py install --root="$pkgdir" --optimize=1
}
