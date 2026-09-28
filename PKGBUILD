# Maintainer: Mario Finelli <mario at finel dot li>

pkgname=python-hcl2
pkgver=8.1.4
pkgrel=1
pkgdesc="A parser for HCL2 written in Python"
arch=(any)
url=https://github.com/amplify-education/python-hcl2
license=(MIT)
depends=(python python-lark python-regex)
makedepends=(git python-build python-installer python-setuptools 
             python-setuptools-scm python-wheel)
checkdepends=(python-coverage python-mock python-nose2)
source=(git+${url}.git#tag=v${pkgver})
sha256sums=('cd3f31ad94e232d681701202c0457e090c71ffda486de04bdabdafc39264c976')

build() {
  cd $pkgname
  python -m build --wheel --no-isolation
}

check() {
  cd $pkgname
  nose2 --config tox.ini --verbose
}

package() {
  cd $pkgname
  python -m installer --destdir="$pkgdir" dist/*.whl

  install -Dm0644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm0644 CHANGELOG.md "$pkgdir/usr/share/doc/$pkgname/CHANGELOG.md"
  install -Dm0644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim: set ts=2 sw=2 et:
