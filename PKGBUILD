# Maintainer: George Rawlinson <george@rawlinson.net.nz>

pkgname=python-semantic-release
pkgver=7.15.1
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
b2sums=('45b1d3bec80cd6cd865015bc8c81049196432febc375c24021888527529c8a43da6b23bc87ba2f35e34f3e87a5002f9106b86252821291adb35ecabbe4226c82')

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
