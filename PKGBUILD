# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python-pytest-pylint
pkgver=0.17.0
pkgrel=1
pkgdesc='pytest plugin to check source code with pylint'
arch=('any')
license=('MIT')
url='https://github.com/carsongee/pytest-pylint'
depends=('python-pytest' 'python-pylint' 'python-toml')
makedepends=('python-pytest-flake8')
source=("$pkgname-$pkgver.tar.gz::https://github.com/carsongee/pytest-pylint/archive/v$pkgver.tar.gz")
sha512sums=('a23937ec191ef14829530ac6bf31b882bc250f312e2ba6e3b8cc1187c888511e4b67ffaf5bce176556a621fbf80239b30c43c635898d458bb8d819e92a9f8142')

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
