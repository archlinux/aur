# Maintainer: peippo <christoph.fink@gmail.com>
pkgbase=python-twitter3

pkgname=('python-twitter3' 'python2-twitter3')
pkgdesc="A Python wrapper around the Twitter API"
url="https://github.com/bear/python-twitter"

pkgver=3.4.2
pkgrel=1

arch=('any')
license=('Apache')

makedepends=('python-setuptools' 'python2-setuptools' 'python-requests-oauthlib' 'python2-requests-oauthlib' 'python2-future' 'python-future')

source=("https://github.com/bear/python-twitter/archive/v${pkgver}.tar.gz")
md5sums=('96569d4d250f88968bbc18deebb0f0a1')

prepare() {
  cd "${srcdir}"/python-twitter-$pkgver
}

build() {
  cp -r "${srcdir}"/python-twitter-$pkgver "${srcdir}"/python-twitter-$pkgver-py2

  cd "${srcdir}"/python-twitter-$pkgver
  python setup.py build

  cd "${srcdir}"/python-twitter-$pkgver-py2
  python2 setup.py build
}

package_python-twitter3() {
  depends=('python-requests-oauthlib' 'python-future')
  makedepends=('python-setuptools' 'python-requests-oauthlib' 'python-future')

  provides=('python-twitter')
  conflicts=('python-twitter')

  cd "${srcdir}/python-twitter-$pkgver"
  python setup.py install --root=${pkgdir} --optimize=1
}

package_python2-twitter3() {
  depends=('python2-requests-oauthlib' 'python2-future')
  makedepends=('python2-setuptools' 'python2-requests-oauthlib' 'python2-future')

  provides=('python2-twitter')
  conflicts=('python2-twitter')

  cd "${srcdir}/python-twitter-$pkgver"
  python2 setup.py install --root=${pkgdir} --optimize=1
}

