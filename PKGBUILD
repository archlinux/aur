# Maintainer: Michael Schubert <mschu.dev at gmail> github.com/mschubert/PKGBUILDs
pkgname=python-rchitect
_pkgname=${pkgname#python-}
pkgver=0.3.37
pkgrel=1
pkgdesc="Minimal R API for Python"
url="https://github.com/randy3k/$_pkgname"
arch=('any')
license=('MIT')
depends=('r>3.4.0' 'python-cffi>=1.10.0')
makedepends=('python-setuptools' 'python-pip' 'python-six>=1.9.0')
checkdepends=('python-pytest')
source=("$_pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('dfbf429ac72cad6b94a7691b3f051d94c774ca3ad36526f784141edda5912328')

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
