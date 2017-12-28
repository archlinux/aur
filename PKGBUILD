# Maintainer: xRemaLx <anton.komolov@gmail.com>
pkgbase=python-klein
pkgname=('python-klein' 'python2-klein')
pkgver=17.10.0
pkgrel=1
arch=('any')
pkgdesc="werkzeug + twisted.web"
url="http://github.com/twisted/klein"
license=('MIT')
makedepends=('python-setuptools' 'python2-setuptools' 'python-incremental' 'python2-incremental'
             'python-hyperlink' 'python2-hyperlink' 'python-attrs' 'python2-attrs'
             'python-six' 'python2-six' 'python-twisted' 'python2-twisted'
             'python-werkzeug' 'python2-werkzeug' 'python-zope-interface' 'python2-zope-interface'
             'python2-typing')
checkdepends=('python-mock' 'python2-mock' 'python-pytest-runner' 'python2-pytest-runner')
source=("$pkgbase-$pkgver.tar.gz::https://github.com/twisted/klein/archive/release-$pkgver.tar.gz")
sha512sums=('611379159d8c06e2e6a63301d6745084f636669043a4acc15334e4ac4b745581a49d83383786e7ddb549b35f6941c9ccd5be35a27372998a6962cb8271eab8dc')

prepare() {
  cp -a klein-release-$pkgver{,-py2}
}

build() {
  cd "$srcdir"/klein-release-$pkgver
  python setup.py build

  cd "$srcdir"/klein-release-$pkgver-py2
  python2 setup.py build
}

check() {
  cd "$srcdir"/klein-release-$pkgver
  python setup.py pytest

  cd "$srcdir"/klein-release-$pkgver-py2
  python2 setup.py pytest
}

package_python-klein() {
  depends=('python-incremental' 'python-attrs' 'python-twisted' 'python-hyperlink'
           'python-six' 'python-werkzeug' 'python-zope-interface')

  cd klein-release-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1
  install -D -m644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

package_python2-klein() {
  depends=('python2-incremental' 'python2-attrs' 'python2-twisted' 'python2-hyperlink'
           'python2-six' 'python2-werkzeug' 'python2-zope-interface' 'python2-typing')

  cd klein-release-$pkgver-py2
  python2 setup.py install --root="$pkgdir" --optimize=1
  install -D -m644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

# vim:set ts=2 sw=2 et: