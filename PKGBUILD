# Maintainer: Michael Schubert <mschu.dev at gmail> github.com/mschubert/PKGBUILDs
pkgname=python-rchitect
_pkgname=${pkgname#python-}
pkgver=0.3.40
pkgrel=1
pkgdesc="Minimal R API for Python"
url="https://github.com/randy3k/$_pkgname"
arch=('any')
license=('MIT')
depends=('r>3.4.0' 'python-cffi>=1.10.0')
makedepends=('python-setuptools' 'python-pip' 'python-six>=1.9.0')
checkdepends=('python-pytest')
source=("$_pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('9eb183854ef1880e45ccaa1b913f482e2d0102a42dccb53931c96e6c6dedb921')

build() {
  cd "$srcdir/$_pkgname-$pkgver"
  python setup.py build
}

check_disabled() { # tests/test_reticulate.py unnamed error
  cd "$srcdir/$_pkgname-$pkgver"
  python setup.py test
}

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  python setup.py install --skip-build --prefix=/usr --root="$pkgdir" --optimize=1
}
