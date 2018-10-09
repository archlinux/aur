# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgbase=python-uhashring
pkgname=(python-uhashring python2-uhashring)
pkgver=1.1
pkgrel=1
pkgdesc="Full featured consistent hashing python library compatible with ketama"
url="https://github.com/ultrabug/uhashring"
license=('BSD')
arch=('any')
makedepends=('python-setuptools' 'python2-setuptools')
checkdepends=('python-pytest-runner' 'python2-pytest-runner' 'python-memcached' 'python2-memcached')
source=("$pkgbase-$pkgver.tar.gz::https://github.com/ultrabug/uhashring/archive/$pkgver.tar.gz")
sha512sums=('4895ddc08e71d9c1ecb28c56fa4c4505cf361b5e92206f4a206682c37922074e48b17a2c09b297e2401f40ca6af0559d7e20f9c67ee8a75274b102ce4f4c9da6')

build() {
  cd uhashring-$pkgver
  python setup.py build
  python2 setup.py build
}

check() {
  cd uhashring-$pkgver
  python setup.py pytest
  python2 setup.py pytest
}

package_python-uhashring() {
  depends=('python')

  cd uhashring-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

package_python2-uhashring() {
  depends=('python2')

  cd uhashring-$pkgver
  python2 setup.py install --root="$pkgdir" --optimize=1
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
