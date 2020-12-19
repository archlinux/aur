# Maintainer: George Rawlinson <george@rawlinson.net.nz>

pkgname=python-semantic-release
pkgver=7.8.1
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
b2sums=('7efe460ef514a6c73c921563e30abd460a9579549866c70dc0e421052d5355acc6a6864f7f633ca4c4b9e22e2016d40aea863525b14cf84c4f26561f2bb225ef')

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
