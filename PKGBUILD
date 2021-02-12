# Maintainer: George Rawlinson <george@rawlinson.net.nz>

pkgname=python-semantic-release
pkgver=7.14.0
pkgrel=1
pkgdesc="Automatic semantic versioning for Python projects"
arch=('any')
url="https://github.com/relekang/python-semantic-release"
license=('MIT')
depends=('python-click'
         'python-click-log'
         'python-gitpython'
         'python-invoke'
         'python-semver'
         'twine'
         'python-requests'
         'python-wheel'
         'python-gitlab'
         'python-tomlkit'
         'python-dotty-dict'
)
makedepends=('python-setuptools')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
b2sums=('070fbdb9c4e85547d67085e96df2e6c7a7a0366363f88fad4031d47106aba1af71e9787ab9e4d05de853a636f4445c05596e64122df79fc48595ca1be5e0a183')

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
