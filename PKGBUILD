# Maintainer: George Rawlinson <george@rawlinson.net.nz>

pkgname=python-flake8-annotations
_pkgname="${pkgname#python-}"
_name="${_pkgname/-/_}"
pkgver=2.3.0
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
b2sums=('b81a0c0409094452f03270e54982cb8bad1a3de02088126df5947e7fbbc863b1c8ae91c7173b274485e829dec93526dc5da3b82c7d2b19841bb999ad3f5e9322')

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
