# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python38-pytest-mypy
pkgver=0.10.1
pkgrel=1
pkgdesc='Mypy static type checker plugin for Pytest'
arch=('any')
license=('MIT')
url='https://github.com/dbader/pytest-mypy'
depends=('mypy' 'python38-filelock' 'python38-pytest')
makedepends=('python38-setuptools-scm')
checkdepends=('python38-pytest-xdist' 'python38-pexpect')
source=("https://github.com/dbader/pytest-mypy/archive/v$pkgver/$pkgname-$pkgver.tar.gz")
sha512sums=('3c86aa94183f28ec066ee5cc8470235a7b052d876d78375d543db705fe99ed4ea9b40bfee9c0ec9f609f643ab146bdecbce1bce5756f7b6069f9f76a02de1fb7')

export SETUPTOOLS_SCM_PRETEND_VERSION=$pkgver

build() {
  cd pytest-mypy-$pkgver
  python3.8 setup.py build
}

check() {
  # Hack entry points by installing it

  cd pytest-mypy-$pkgver
  python3.8 setup.py install --root="$PWD/tmp_install" --optimize=1
  PYTHONPATH="$PWD/tmp_install/usr/lib/python3.8/site-packages:$PYTHONPATH" pytest
}

package() {
  cd pytest-mypy-$pkgver
  python3.8 setup.py install --root="$pkgdir" --optimize=1
  install -D -m644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname/
}

# vim:set ts=2 sw=2 et:
