# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python2-pytest-mock
pkgver=2.0.0
pkgrel=4
pkgdesc="Thin-wrapper around the mock package for easier use with py.test"
arch=('any')
license=('LGPL3')
url="https://github.com/pytest-dev/pytest-mock/"
depends=('python2-mock' 'python2-pytest')
makedepends=('python2-setuptools-scm')
source=("https://github.com/pytest-dev/pytest-mock/archive/v$pkgver/$pkgname-$pkgver.tar.gz")
sha512sums=('0bd15bf07e28fcea72f0269f09fe340bc1f01dd4e5f20215894c59e244ebad6ba15c8ef67c1547be0a750cff3e50536e0c1ca2d783a895eecbc492ece6c6fc55')

export SETUPTOOLS_SCM_PRETEND_VERSION=$pkgver

build() {
  cd pytest-mock-$pkgver
  python2 setup.py build
}

check() {
  cd pytest-mock-$pkgver
  python2 setup.py egg_info
  PYTHONPATH="$PWD:$PWD/src" pytest2
}

package() {
  cd pytest-mock-$pkgver
  python2 setup.py install --root="$pkgdir" --optimize=1
}
