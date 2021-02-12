# Maintainer: George Rawlinson <george@rawlinson.net.nz>

pkgname=python-nox-poetry
_pkgname="${pkgname#python-}"
_name="${_pkgname/-/_}"
pkgver=0.8.1
pkgrel=1
pkgdesc="Use Poetry inside Nox sessions"
arch=('any')
url="https://github.com/cjolowicz/nox-poetry"
license=('MIT')
depends=('python' 'python-nox')
makedepends=('python-setuptools' 'python-dephell')
checkdepends=() # TODO
optdepends=()
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
b2sums=('24130c5959333d7b5c9847826928111001858a349648251fb02a9e3506bcfc17b59e5e821349bb7f030f3bbaee2e74ce5c4ced95e9d974963f25c34ee8a42284')

prepare() {
  cd "$_pkgname-$pkgver"
  dephell deps convert --from pyproject.toml --to setup.py
}

build() {
  cd "$_pkgname-$pkgver"
  python setup.py build
}

package() {
  cd "$_pkgname-$pkgver"
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build

  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE.rst
}
