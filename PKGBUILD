# Maintainer: Michael Schubert <mschu.dev at gmail>
pkgname=python-rchitect
_pkgname=${pkgname#python-}
pkgver=0.3.30
pkgrel=1
pkgdesc="Minimal R API for Python"
url="https://github.com/randy3k/$_pkgname"
arch=('any')
license=('MIT')
depends=('r>3.4.0' 'python-multipledispatch' 'python-cffi>=1.10.0')
makedepends=('python-setuptools' 'python-six>=1.9.0')
checkdepends=('python-pytest')
source=("$_pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('6ff64aa2d08f3c82dfafdc1728e0852b530cd4c380ed9eff2a5453735be834b7')

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
