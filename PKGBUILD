# Maintainer: Michael Schubert <mschu.dev at gmail>
pkgname=python-rchitect
_pkgname=${pkgname#python-}
pkgver=0.3.32
pkgrel=1
pkgdesc="Minimal R API for Python"
url="https://github.com/randy3k/$_pkgname"
arch=('any')
license=('MIT')
depends=('r>3.4.0' 'python-multipledispatch' 'python-cffi>=1.10.0')
makedepends=('python-setuptools' 'python-six>=1.9.0')
checkdepends=('python-pytest')
source=("$_pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('85dbfd71e7d72764d77786a49845085e64ae18b234c84162c72002475be5115f')

build() {
  cd "$srcdir/$_pkgname-$pkgver"
  python setup.py build
}

check_disabled() { # unnamed error
  cd "$srcdir/$_pkgname-$pkgver"
  python setup.py test
}

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  python setup.py install --skip-build --prefix=/usr --root="$pkgdir" --optimize=1
}
