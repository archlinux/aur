# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python-uhashring
pkgver=1.2
pkgrel=3
pkgdesc="Full featured consistent hashing python library compatible with ketama"
url="https://github.com/ultrabug/uhashring"
license=('BSD')
arch=('any')
depends=('python')
makedepends=('python-setuptools')
checkdepends=('python-pytest-runner' 'python-memcached')
source=("$pkgbase-$pkgver.tar.gz::https://github.com/ultrabug/uhashring/archive/$pkgver.tar.gz")
sha512sums=('8b4b6201a3d337f57e103b9cc95bdbe3ec8efb7da529207e97c6c860f8ec58fb8e0931b633efe4b78892cf2a0761b3ea249529a5ab3fb7c81b98a8c6b69a8cbf')

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
