# Maintainer: George Rawlinson <george@rawlinson.net.nz>

pkgname=python-flake8-annotations
_pkgname="${pkgname#python-}"
_name="${_pkgname/-/_}"
pkgver=2.6.1
pkgrel=1
pkgdesc="A flake8 extension that checks type annotations"
arch=('any')
url="https://github.com/sco1/flake8-annotations"
license=('MIT')
depends=('python' 'flake8')
makedepends=('python-setuptools' 'python-dephell')
checkdepends=('python-pytest' 'python-pytest-check' 'python-pytest-cov')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
b2sums=('7f390ed097564b83de6d3ec7d43e97a754b1f1fa2aaf7ff48de0bbc3adecfc1571254e17b6c4d5e16e092f42b31bbcd201fa8d2fefef54a6c40d77dfab1386dc')

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
