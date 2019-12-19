# Maintainer: peippo <christoph.fink@gmail.com>
pkgbase=python-twitter3

pkgname=('python-twitter3' 'python2-twitter3')
pkgdesc="A Python wrapper around the Twitter API"
url="https://github.com/bear/python-twitter"

pkgver=3.5
pkgrel=0

arch=('any')
license=('Apache')

makedepends=('python-setuptools' 'python2-setuptools' 'python-requests-oauthlib' 'python2-requests-oauthlib' 'python2-future' 'python-future')

source=("https://github.com/bear/python-twitter/archive/v${pkgver}.tar.gz")
sha512sums=('51daf6be7eb1ee3e336b17ed161be9899bb84a2527decc512c0ea0d823ef2193359c239c0adf315e5116afd3be529aa99f8810c3580608071cd576d4e6e71f31')

prepare() {
  cd "${srcdir}/python-twitter-$pkgver"
}

build() {
  cp -r "${srcdir}/python-twitter-$pkgver" "${srcdir}/python-twitter-$pkgver-py2"

  cd "${srcdir}/python-twitter-$pkgver"
  python setup.py build

  cd "${srcdir}/python-twitter-$pkgver-py2"
  python2 setup.py build
}

package_python-twitter3() {
  depends=('python-requests-oauthlib')

  provides=('python-twitter')
  conflicts=('python-twitter')

  cd "${srcdir}/python-twitter-$pkgver"
  python setup.py install --root="${pkgdir}" --optimize=1
}

package_python2-twitter3() {
  depends=('python2-requests-oauthlib')

  provides=('python2-twitter')
  conflicts=('python2-twitter')

  cd "${srcdir}/python-twitter-$pkgver"
  python2 setup.py install --root="${pkgdir}" --optimize=1
}

