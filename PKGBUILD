# Maintainer: George Rawlinson <george@rawlinson.net.nz>

pkgname=python-semantic-release
pkgver=7.13.1
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
b2sums=('693b27f16aa231f6500fc0e1297b615479834198e309d292ae807ac6d3a061a8129d92ddce1fe42d30dfc3d24e7d6d49c2bfdac24ba0bb59d195a353585ea6da')

build() {
  cd "$pkgname-$pkgver"
  python setup.py build
}

package() {
  cd "$pkgname-$pkgver"
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build

  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE

  rm -rf "$pkgdir"/usr/lib/python*/site-packages/tests
}
