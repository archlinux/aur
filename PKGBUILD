# Maintainer: George Rawlinson <george@rawlinson.net.nz>

pkgname=python-flake8-annotations
_pkgname="${pkgname#python-}"
_name="${_pkgname/-/_}"
pkgver=2.4.0
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
b2sums=('4dad2d15ccd2ee79947c216ce9a5058700af41580192b8445753494d4c106e4d578a27c6f02cd0caa64e3d4dad5f667cb7e457dd149548ac8f3667b6afbf5d91')

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
