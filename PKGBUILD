# Maintainer: Adrien Wu <adrien.sf.wu@gmail.com>
pkgname=python2-incremental
pkgver=22.10.0
pkgrel=2
pkgdesc="A small library that versions your Python projects."
url="https://github.com/twisted/incremental"
arch=('any')
license=('MIT')
depends=('python2')
makedepends=('python2-setuptools' 'python2-typing')
checkdepends=('python2-pytest' 'python2-twisted' 'python2-click')
_name="${pkgname#python2-}"
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('912feeb5e0f7e0188e6f42241d2f450002e11bbc0937c65865045854c24c0bd0')

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
