# Contributor: Felix Kaiser <felix.kaiser@fxkr.net>

pkgbase=python-mock
pkgname=(python2-mock python-mock)
pkgver=1.0.1
pkgrel=1
pkgdesc="A Python Mocking and Patching Library for Testing"
url='http://www.voidspace.org.uk/python/mock/'
makedepends=('python2' 'python')
license=('BSD')
arch=('any')
source=("http://pypi.python.org/packages/source/m/mock/mock-$pkgver.tar.gz")
md5sums=('c3971991738caa55ec7c356bbc154ee2')

build() {
  cd "$srcdir"
  cp -rf "mock-$pkgver" "mock2-$pkgver"

  cd "$srcdir/mock-$pkgver"
  python3 setup.py build

  cd "$srcdir/mock2-$pkgver"
  python2 setup.py build
}

package_python-mock() {
depends=('python')
  cd "$srcdir/mock-$pkgver"
  python3 setup.py install --optimize=1 --root="$pkgdir"
  install -Dm644 LICENSE.txt "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE
}

package_python2-mock() {
depends=('python2')
  cd "$srcdir/mock2-$pkgver"
  python2 setup.py install --optimize=1 --root="$pkgdir"
  install -Dm644 LICENSE.txt "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE
}
