# Maintainer: Danilo J. S. Bellini <danilo dot bellini at gmail dot com>
pkgname=python2-traceback2
_name="${pkgname#python2-}"
pkgver=1.4.0
pkgrel=7
pkgdesc='Backports of the traceback module'
arch=('any')
_pypi='https://pypi.python.org'
url="$_pypi/pypi/$_name"
license=('Python')
depends=('python2-linecache2' 'python2-six')
makedepends=('python2-setuptools' 'python2-pbr')
_githubraw='https://raw.githubusercontent.com/testing-cabal/traceback2'
_commit_license='36d6f8b755367defcf73c9ef308de952502dccb1'
source=("$_pypi/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz"
        "$_name-$pkgver-LICENSE.txt::$_githubraw/$_commit_license/LICENSE")
sha256sums=('05acc67a09980c2ecfedd3423f7ae0104839eccb55fc645773e1caa0951c3030'
            '8e6bd29d1ca0d1744ae87eb2b19f680569f0a1b2b1c8a2f4583ff7196d5b7cc5')

build() {
  cd "$srcdir/$_name-$pkgver"
  python2 setup.py build
}

package() {
  cd "$srcdir/$_name-$pkgver"
  python2 setup.py install --root="$pkgdir" --optimize=1 --skip-build
  install -Dm644 "../$_name-$pkgver-LICENSE.txt" \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE.txt"
}
