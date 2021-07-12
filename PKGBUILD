# Maintainer: xiretza <xiretza+aur@xiretza.xyz>

_pkgname='pyAttributes'
pkgname=python-${_pkgname,,}
pkgver=2.1.0
pkgrel=1
pkgdesc="Implementations of .NET-like attributes realized with Python decorators"
arch=(any)
url="https://github.com/Paebbels/pyAttributes"
license=('Apache')
depends=('python-argcomplete')
makedepends=('python-setuptools')
checkdepends=('python-pytest')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('ab4b3cef5f4dc2d74ad935594c317300197fb462eab55710a7f1bbfc004396a7')

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
