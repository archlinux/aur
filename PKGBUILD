# Maintainer: Fernando Ortiz <nandub+arch@nandub.info>

pkgbase=python-doitlive
pkgname=(python-doitlive python2-doitlive)
pkgver=4.3.0
pkgrel=2
pkgdesc="Because sometimes you need to do it live"
arch=("any")
url="https://github.com/sloria/doitlive"
license=('MIT')
makedepends=('python-setuptools' 'python2-setuptools')
source=("https://github.com/sloria/doitlive/archive/$pkgver.tar.gz")
sha256sums=('9641ce3024c2585defea63e87fc8f7384d6fac466db6ead5c3509093fe859377')

prepare() {
  # copy folder, so we can cleanly build for both python versions
  cp -rup doitlive-$pkgver py2doitlive-$pkgver
}

build() {
  # build for python 3
  cd doitlive-$pkgver
  python setup.py build

  # build for python 2
  cd ../py2doitlive-$pkgver
  python2 setup.py build
}

# package for python 3
package_python-doitlive() {
  depends=('python' 'python-click-didyoumean' 'python-click-completion')
  pkgdesc+=" for Python 3"

  cd doitlive-$pkgver

  python setup.py install --root="$pkgdir/" --optimize=1
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

# package for python 2
package_python2-doitlive() {
  depends=('python2' 'python-click-didyoumean' 'python-click-completion')
  pkgdesc+=" for Python 2"

  cd py2doitlive-$pkgver

  python2 setup.py install --root="$pkgdir/" --optimize=1
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

