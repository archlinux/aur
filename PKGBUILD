# Maintainer: George Rawlinson <george@rawlinson.net.nz>

pkgname=python-flake8-annotations
_pkgname="${pkgname#python-}"
_name="${_pkgname/-/_}"
pkgver=2.5.0
pkgrel=1
pkgdesc="A flake8 extension that checks type annotations"
arch=('any')
url="https://github.com/sco1/flake8-annotations"
license=('MIT')
depends=('python' 'flake8')
makedepends=('python-setuptools' 'python-dephell')
checkdepends=('python-pytest' 'python-pytest-check' 'python-pytest-cov')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
b2sums=('83f1549bf085f9080d3b1e56be466fd8c99f3722be37bb50348cbdc752818e53aac21b9f495fa145e4ebffb72c7a7d6b2fcbcff0bf2def9385226033fe20e019')

prepare() {
  cd "$_pkgname-$pkgver"
  dephell deps convert --from pyproject.toml --to setup.py
}

check() {
  cd "$_pkgname-$pkgver"
  pytest --ignore testing/test_flake8_actually_runs_checker.py .
}

build() {
  cd "$_pkgname-$pkgver"
  python setup.py build
}

package() {
  cd "$_pkgname-$pkgver"
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build

  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
