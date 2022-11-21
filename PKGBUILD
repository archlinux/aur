# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Jerome Leclanche <jerome@leclan.ch>

pkgname=python38-webtest
pkgver=3.0.0
pkgrel=3
pkgdesc="Helper to test WSGI applications"
arch=('any')
url='http://webtest.pythonpaste.org/'
license=('MIT')
depends=('python38-webob' 'python38-beautifulsoup4' 'python38-waitress')
optdepends=('python38-pyquery: for response.pyquery'
            'python38-lxml: for response.lxml')
makedepends=('python38-setuptools')
checkdepends=('python38-pytest' 'python38-pyquery' 'python38-pastedeploy' 'python38-wsgiproxy2')
source=("https://pypi.io/packages/source/W/WebTest/WebTest-$pkgver.tar.gz")
sha512sums=('b97a6311d7e3bf653bec93c2390fb75c991d0dea6148680d8b6ff87861c130518a5d150dd157eab9b032b278566ad12c0ac8f5fc2ddbeba31e35de1e1f06f747')

build() {
  cd WebTest-$pkgver
  python3.8 setup.py build
}

check() {
  cd WebTest-$pkgver
  pytest
}

package() {
  cd WebTest-$pkgver
  python3.8 setup.py install --prefix=/usr --root="$pkgdir" --optimize=1 --skip-build
  install -Dm644 license.rst "$pkgdir"/usr/share/licenses/$pkgname/license.rst
}
