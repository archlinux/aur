# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Gordian Edenhofer <gordian.edenhofer[at]yahoo[dot]de>

pkgbase=python-acme
pkgname=('python-acme' 'python2-acme')
pkgver=0.0.0.dev20151123
pkgrel=1
pkgdesc="ACME protocol implementation in Python"
arch=('any')
license=('Apache')
url="https://github.com/letsencrypt/letsencrypt"
makedepends=('python-setuptools' 'python2-setuptools' 'python-pyasn1' 'python2-pyasn1'
             'python-cryptography' 'python2-cryptography' 'python-pyopenssl' 'python2-pyopenssl'
             'python-ndg-httpsclient' 'python2-ndg-httpsclient' 'python-pyrfc3339'
             'python2-pyrfc3339' 'python-pytz' 'python2-pytz' 'python-requests'
             'python2-requests' 'python-six' 'python2-six' 'python-werkzeug' 'python2-werkzeug'
             'python-mock' 'python2-mock')
checkdepends=('python-nose' 'python2-nose')
source=("https://pypi.python.org/packages/source/a/acme/acme-$pkgver.tar.gz")
sha512sums=('5520acfb6232fc940606a731db93508b0ef213d294e2d5763c91b36311a7347612f345282a2ecee5f4f072fe2c5fd4dfb8810d4ee87d36aa201cdf124604e674')

prepare() {
  cp -a acme-$pkgver{,-py2}
}

build() {
  cd "$srcdir/acme-$pkgver"
  python setup.py build

  cd "$srcdir/acme-$pkgver-py2"
  python2 setup.py build
}

check() {
  cd "$srcdir/acme-$pkgver"
  nosetests3

  cd "$srcdir/acme-$pkgver-py2"
  nosetests2
}

package_python-acme() {
  depends=('python-setuptools' 'python-pyasn1' 'python-cryptography' 'python-pyopenssl'
           'python-ndg-httpsclient' 'python-pyrfc3339' 'python-pytz' 'python-requests'
           'python-six' 'python-werkzeug' 'python-mock')

  cd acme-$pkgver
  python setup.py install --root="${pkgdir}" --optimize=1
}

package_python2-acme() {
  depends=('python2-setuptools' 'python2-pyasn1' 'python2-cryptography' 'python2-pyopenssl'
           'python2-ndg-httpsclient' 'python2-pyrfc3339' 'python2-pytz' 'python2-requests'
           'python2-six' 'python2-werkzeug' 'python2-mock')

  cd acme-$pkgver-py2
  python2 setup.py install --root="${pkgdir}" --optimize=1

  mv "$pkgdir"/usr/bin/jws{,2}
}
