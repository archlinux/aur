# Maintainer: George Rawlinson <george@rawlinson.net.nz>

pkgname=python-semantic-release
pkgver=7.5.0
pkgrel=1
pkgdesc="Automatic semantic versioning for Python projects"
arch=('any')
url="https://github.com/relekang/python-semantic-release"
license=('MIT')
depends=('python-click'
         'python-click-log'
         'python-gitpython'
         'python-semver'
         'python-invoke'
         'twine'
         'python-requests'
         'python-wheel'
         'python-toml'
         'python-gitlab')
makedepends=('python-setuptools')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
b2sums=('9690e03a37f809bd397d46251d7f83743e1a0aadca6603ab13e275ed8f1c0e336ce67d21cd58fa6147702e6cc19ba0cd839e44966695650ff5824f67d3f1ad3d')

build() {
  cd "$pkgname-$pkgver"
  python setup.py build
}

package() {
  cd "$pkgname-$pkgver"
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build

  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE

  rm -rf "$pkgdir/usr/lib/"python*"/site-packages/tests"
}
