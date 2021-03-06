# Maintainer: George Rawlinson <george@rawlinson.net.nz>

pkgname=python-flake8-annotations
_pkgname="${pkgname#python-}"
_name="${_pkgname/-/_}"
pkgver=2.6.0
pkgrel=1
pkgdesc="A flake8 extension that checks type annotations"
arch=('any')
url="https://github.com/sco1/flake8-annotations"
license=('MIT')
depends=('python' 'flake8')
makedepends=('python-setuptools' 'python-dephell')
checkdepends=('python-pytest' 'python-pytest-check' 'python-pytest-cov')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
b2sums=('71d268f7e32ee84bae38260fcc934c25a2e7624869d7f2da272bef2d1925a35e3533707c88e43036ba82e5896499a9cd12917f24320a96e7cb990493ce3c4356')

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
