# Maintainer: xiretza <xiretza+aur@xiretza.xyz>

_pkgname='pyTooling.Packaging'
pkgname=python-${_pkgname,,}
pkgname=${pkgname/./-}
pkgver=0.3.0
pkgrel=1
pkgdesc="A set of helper functions to describe a Python package for setuptools."
arch=(any)
url="https://github.com/pyTooling/$_pkgname"
license=('Apache')
depends=('python')
makedepends=('python-setuptools')
checkdepends=('python-pytest')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('2ad351c4902aa447b1818d3ca70d6716c2de6cff5ff2933726628bbbb56cd3c2')

build() {
  cd "$_pkgname-$pkgver"
  python setup.py build
}

check(){
  cd "$_pkgname-$pkgver"
  pytest tests/
}

package() {
  cd "$_pkgname-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}
