# Maintainer: George Rawlinson <grawlinson@archlinux.org>

pkgname=python38-fqdn
pkgver=1.5.1
pkgrel=1
pkgdesc='RFC-compliant FQDN validation and manipulation for Python'
arch=('any')
url='https://github.com/ypcrts/fqdn'
license=('MPL2')
depends=('python38')
makedepends=(
  'git'
  'python38-build'
  'python38-installer'
  'python38-wheel'
  'python38-setuptools'
)
checkdepends=('python38-pytest')
_commit='3a4feda3414bde7b3386e995ed1d2ed36607d4cf'
source=("$pkgname::git+$url#commit=$_commit")
b2sums=('SKIP')

pkgver() {
  cd "$pkgname"

  git describe --tags | sed 's/^v//'
}

build() {
  cd "$pkgname"

  python3.8 -m build --wheel --no-isolation
}

check() {
  cd "$pkgname"

  pytest -v 
}

package() {
  cd "$pkgname"

  python3.8 -m installer --destdir="$pkgdir" dist/*.whl

  # documentation
  install -vDm644 -t "$pkgdir/usr/share/doc/$pkgname" README.rst
}
