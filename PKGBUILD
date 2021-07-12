# Maintainer: xiretza <xiretza+aur@xiretza.xyz>

_pkgname='pyExceptions'
pkgname=python-${_pkgname,,}
pkgver=1.0.1
pkgrel=1
pkgdesc="An exception base-class to derive more powerful exceptions"
arch=(any)
url="https://github.com/Paebbels/pyExceptions"
license=('Apache')
depends=('python-sphinxextensions')
makedepends=('python-setuptools')
checkdepends=('python-pytest')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('7f573cd1b15e7f14bf25ac541f7dece6f8042c0bfd6c13b562818d7caeee3bf9')

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
