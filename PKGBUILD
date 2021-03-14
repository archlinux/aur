# Maintainer: George Rawlinson <george@rawlinson.net.nz>

pkgname=python-nox-poetry
_pkgname="${pkgname#python-}"
_name="${_pkgname/-/_}"
pkgver=0.8.3
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
b2sums=('6852bc419bce21742a51aef3f21cf714068ac7d877b5382d04555dbf57ade556363d22dc353679805ab4ebbd02f23858317780e8510cb31749ada7f2c033a077')

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
