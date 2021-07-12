# Maintainer: xiretza <xiretza+aur@xiretza.xyz>

_pkgname='pyTerminalUI'
pkgname=python-${_pkgname,,}
pkgver=1.3.4
pkgrel=1
pkgdesc="A set of helpers to implement a text user interface (TUI) in a terminal"
arch=(any)
url="https://github.com/Paebbels/pyTerminalUI"
license=('Apache')
depends=('python-colorama' 'python-pyexceptions' 'python-pymetaclasses')
makedepends=('python-setuptools')
checkdepends=('python-pytest')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('75843183d41e6696352a29a18ea97a3b66ef2c82cf0bc70b68c78e0a0a6126ec')

build() {
  cd "$_pkgname-$pkgver"
  python setup.py build
}

check(){
  cd "$_pkgname-$pkgver"
  touch tests/__init__.py
  pytest --override-ini 'python_files=*' tests/
}

package() {
  cd "$_pkgname-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}
