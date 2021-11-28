# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Jameson Pugh <imntreal@gmail.com>

pkgname=('python-decorators' 'python2-decorators')
pkgver=2.0.7
pkgrel=1
pkgdesc="Quickly create flexible Python decorators"
arch=('any')
url="https://github.com/jaymon/decorators"
license=('MIT')
makedepends=('python-setuptools' 'python2-setuptools')
source=("$pkgname-$pkgver.tar.gz::https://files.pythonhosted.org/packages/source/d/decorators/decorators-$pkgver.tar.gz"
        "LICENSE::$url/raw/master/LICENSE.txt")
sha256sums=('9cf26202d6170a5cdca8a9cf6cd4b467c10601d4a9076470bceb9d282a5fa28a'
            '9fd61e97b164020abd86853f13e58609a0053046f8963fd01a32adef7defa2c8')

prepare() {
  cp -a "decorators-$pkgver" "decorators-$pkgver-py2"
}

build() {
  ( cd "decorators-$pkgver"
    python setup.py build )
  ( cd "decorators-$pkgver-py2"
    python2 setup.py build )
}

package_python2-decorators() {
  depends=('python2')

  cd "decorators-$pkgver-py2"
  PYTHONHASHSEED=0 python2 setup.py install --root="$pkgdir/" --optimize=1 --skip-build
  install -Dm644 "$srcdir/LICENSE" -t "$pkgdir/usr/share/licenses/$pkgname/"
  install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}

package_python-decorators() {
  depends=('python')

  cd "decorators-$pkgver"
  PYTHONHASHSEED=0 python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
  install -Dm644 "$srcdir/LICENSE" -t "$pkgdir/usr/share/licenses/$pkgname/"
  install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}

# vim:set ts=2 sw=2 et:
