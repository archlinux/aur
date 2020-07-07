# Maintainer: George Rawlinson <george@rawlinson.net.nz>

pkgname=python-flake8-annotations
_pkgname="${pkgname#python-}"
_name="${_pkgname/-/_}"
pkgver=2.2.0
pkgrel=1
pkgdesc="A flake8 extension that checks type annotations"
arch=('any')
url="https://github.com/python-discord/flake8-annotations"
license=('MIT')
depends=('python' 'flake8' 'python-typed-ast')
makedepends=('python-setuptools' 'python-dephell')
checkdepends=() # TODO
optdepends=()
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
b2sums=('eb4b6e5436a58dda63c1885a60b5f6018ff0e5eddb1b6bb9151797d68787197b0693695f45c589785016442fe7d18f98a6015ee56eb3b99227f89bf0a6d40d64')

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

  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
