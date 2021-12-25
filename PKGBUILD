# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python-uhashring
pkgver=2.1
pkgrel=1
pkgdesc="Full featured consistent hashing python library compatible with ketama"
url="https://github.com/ultrabug/uhashring"
license=('BSD')
arch=('any')
depends=('python')
makedepends=('python-setuptools')
checkdepends=('python-pytest-runner' 'python-memcached')
source=("$pkgname-$pkgver.tar.gz::https://github.com/ultrabug/uhashring/archive/$pkgver.tar.gz")
sha512sums=('ebd3d61c203ed3c34622523f80ed8d0f89a20556b83251a416ce336343e28a9842a1786b6f8aad61728ef597ec5de910bad1292b48d336a8ae16996eafb92929')

build() {
  cd uhashring-$pkgver
  python setup.py build
}

check() {
  cd uhashring-$pkgver
  python setup.py pytest
}

package_python-uhashring() {
  cd uhashring-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
