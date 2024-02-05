# Maintainer: Adrien Wu <adrien.sf.wu@gmail.com>
pkgname=python2-incremental
pkgver=21.3.0
pkgrel=2
pkgdesc="A small library that versions your Python projects."
url="https://github.com/twisted/incremental"
arch=('any')
license=('MIT')
depends=('python2')
makedepends=('python2-setuptools')
checkdepends=('python2-pytest' 'python2-twisted' 'python2-click')
_name="${pkgname#python2-}"
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('02f5de5aff48f6b9f665d99d48bfc7ec03b6e3943210de7cfc88856d755d6f57')

build() {
  cd "$srcdir/$_name-$pkgver"
  python2 setup.py build
}

package() {
  cd "$srcdir/$_name-$pkgver"
  python2 setup.py install --root="$pkgdir/" --optimize=1 --skip-build
  install -Dm644 -t "$pkgdir"/usr/share/licenses/$pkgname LICENSE
}

check() {
  cd "$srcdir/$_name-$pkgver"
  python2 -m pytest
}
