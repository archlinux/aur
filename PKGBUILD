# Maintainer: George Rawlinson <george@rawlinson.net.nz>

pkgname=python-semantic-release
pkgver=7.4.0
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
b2sums=('c32a68b9ffcdf24e0ce313c589bcbeac9047def5970b097724e6f46b880cc63171902ea55c32ea43687b5b1b53eb6bb99f06c67834fbf5c7ea915fb92fb4c3dc')

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
