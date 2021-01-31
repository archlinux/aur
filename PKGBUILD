# Maintainer: George Rawlinson <george@rawlinson.net.nz>

pkgname=python-semantic-release
pkgver=7.13.2
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
b2sums=('281e18a840eb4a102a4f4633395f9bcd3bfff10e96543fd484b98f32261431062db7fb9f6eeb93463b295903b43d728318179fedbfb288a063ebe80740953abc')

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
