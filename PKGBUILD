# Maintainer: Danny Waser <danny@waser.tech>
# Contributor: Felix Yan <felixonmars@archlinux.org>

pkgname=python38-pytest-sugar
pkgver=0.9.6
_commit=59428a115d0646f4d771f4da20e32904b09331fe
pkgrel=1
pkgdesc='A plugin for py.test that changes the default look and feel of py.test'
arch=('any')
license=('BSD')
url='https://pivotfinland.com/pytest-sugar/'
depends=('python38-pytest' 'python38-termcolor' 'python38-packaging')
makedepends=('python38-setuptools')
source=("https://github.com/Frozenball/pytest-sugar/archive/$_commit/$pkgname-$_commit.tar.gz")
sha512sums=('be5d370422b10f5edaa6ddc2fdbabc5c74cdfa992aa70da1884cc4bd8103ada2922a8648c34334bd80705f3aa17db68e25e172dc94cc26af3a7b25405e37b093')

prepare() {
  mv pytest-sugar-{$_commit,$pkgver}
}

build() {
  cd pytest-sugar-$pkgver
  python3.8 setup.py build
}

check() {
  # Hack entry points by installing it

  cd pytest-sugar-$pkgver
  python3.8 setup.py install --root="$PWD/tmp_install" --optimize=1
  PYTHONPATH="$PWD/tmp_install/usr/lib/python3.8/site-packages:$PYTHONPATH" pytest
}

package() {
  cd pytest-sugar-$pkgver
  python3.8 setup.py install --root="$pkgdir" --optimize=1
  install -Dm644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname/
}

# vim:set ts=2 sw=2 et:
