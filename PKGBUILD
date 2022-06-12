# Maintainer: Danilo J. S. Bellini <danilo dot bellini at gmail dot com>
pkgname=python2-pbr
_name="${pkgname#python2-}"
pkgver=5.9.0
pkgrel=2
pkgdesc='Python Build Reasonableness (for Python 2)'
arch=('any')
_pypi='https://pypi.python.org'
url="$_pypi/pypi/$_name"
license=('Apache')
depends=('python2-setuptools')
source=("$_pypi/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('e8dca2f4b43560edef58813969f52a56cef023146cbb8931626db80e6c1c4308')

build() {
  cd "$srcdir/$_name-$pkgver"
  python2 setup.py build
}

package() {
  cd "$srcdir/$_name-$pkgver"
  python2 setup.py install --root="$pkgdir" --optimize=1 --skip-build
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE.txt"
  mv "$pkgdir/usr/bin/pbr"{,2}
}
