# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python-pytest-pylint
pkgver=0.16.0
pkgrel=1
pkgdesc='pytest plugin to check source code with pylint'
arch=('any')
license=('MIT')
url='https://github.com/carsongee/pytest-pylint'
depends=('python-pytest' 'python-pylint' 'python-toml')
makedepends=('python-pytest-flake8')
source=("$pkgname-$pkgver.tar.gz::https://github.com/carsongee/pytest-pylint/archive/$pkgver.tar.gz")
sha512sums=('e2df53d6996ec4249f4dc77941871e1b37c6ba8bbc8b41944d2f6bfbf7a150cf7d382caa207f224f2efa8e8b1396e3b9a60a66f98b7c28f5cfa833815520d708')

build() {
  cd pytest-pylint-$pkgver
  python setup.py build
}

check() {
  # Hack entry points by installing it

  cd pytest-pylint-$pkgver
  python setup.py install --root="$PWD/tmp_install" --optimize=1
  PYTHONPATH="$PWD/tmp_install/usr/lib/python3.8/site-packages:$PYTHONPATH" pytest --ignore tmp_install
}

package() {
  cd pytest-pylint-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1
  install -D -m644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname/
}

# vim:set ts=2 sw=2 et:
