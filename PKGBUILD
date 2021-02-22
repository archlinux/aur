# Maintainer: George Rawlinson <george@rawlinson.net.nz>

pkgname=python-semantic-release
pkgver=7.15.0
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
b2sums=('dfed0fed7b0344f2a458c0e220564994d4c3c8323f6255810bc6ea76a851fc82338b13191dc206e628a5a8b09b616535c8290e1aa6dfb5a9e4d2a1ab58268fb6')

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
