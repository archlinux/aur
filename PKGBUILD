# Maintainer: George Rawlinson <grawlinson@archlinux.org>

pkgname=pypyr
pkgver=4.6.0
pkgrel=1
pkgdesc="Task runner for automation pipelines"
arch=('any')
url="https://pypyr.io"
license=('Apache')
depends=('python' 'python-dateutil' 'python-ruamel-yaml')
makedepends=('python-setuptools')
checkdepends=('python-pytest')
source=("$pkgname-$pkgver.tar.gz::https://github.com/pypyr/pypyr/archive/v$pkgver.tar.gz")
sha512sums=('1d5a20a92eb0ed9ef82aced007e75f2c0a35ff11e9593bc32212fa74daacb4c88a44927b55f8fcad16525a9741123c0cb0d4b07bc414bdb1d313192fd646b221')
b2sums=('c07d80e17ed84ad30417e5def8768df0089d555041655b83b1b025da74a78c068870d9a02cac6ac43ac5c5258c40edaee9dff36c169b85fe92a757541060b1d8')

build() {
  cd "$pkgname-$pkgver"
  python setup.py build
}

check() {
  cd "$pkgname-$pkgver"
  pytest
}

package() {
  cd "$pkgname-$pkgver"
  python setup.py install --root="$pkgdir" --optimize=1

  # delete tests folder
  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
  rm -rf "$pkgdir/$site_packages/tests"
}
