# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python38-pytest-timeout
pkgver=2.1.0
pkgrel=1
pkgdesc='py.test plugin to abort hanging tests'
arch=('any')
license=('MIT')
url='https://github.com/pytest-dev/pytest-timeout'
depends=('python38-pytest')
makedepends=('python38-setuptools' 'python38-pytest')
checkdepends=('python38-pexpect' 'python38-pytest-cov')
source=("https://github.com/pytest-dev/pytest-timeout/archive/$pkgver/$pkgname-$pkgver.tar.gz")
sha512sums=('4897c111a0b0ae1287cbc3d9d641fd0908a6b47d505159378391d9d8da3912411adf86b236c22a3f7501c3b3cf84c279711ac8bab19b3e3b83ae67f069331aab')

build() {
  cd pytest-timeout-$pkgver
  python3.8 setup.py build
}

check() {
  # Hack entry points by installing it

  cd pytest-timeout-$pkgver
  python3.8 setup.py install --root="$PWD/tmp_install" --optimize=1
  PYTHONPATH="$PWD/tmp_install/usr/lib/python3.8/site-packages:$PYTHONPATH" py.test
}

package() {
  cd pytest-timeout-$pkgver
  python3.8 setup.py install --root="$pkgdir"/ --optimize=1
  install -Dm644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname/
}

# vim:set ts=2 sw=2 et:
