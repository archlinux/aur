# Maintainer: George Rawlinson <grawlinson@archlinux.org>
# Contributor: Marco A Rojas <marco.rojas@zentek.com.mx>

pkgname=python-migra
pkgver=3.0.1621480950
pkgrel=2
pkgdesc="A schema comparison tool for PostgreSQL"
arch=('any')
url="https://databaseci.com/docs/migra"
license=('Unlicense')
depends=(
  'python'
  'python-sqlbag'
  'python-six'
  'python-schemainspect'
  'python-psycopg2'
)
makedepends=(
  'git'
  'python-build'
  'python-poetry-core'
  'python-installer'
)
_commit='01acaf2edac85f2a9329169159ad610ab1fa66be'
source=("$pkgname::git+https://github.com/djrobstep/migra.git#commit=$_commit")
b2sums=('SKIP')

pkgver() {
  cd "$pkgname"

  git describe --tags | sed 's/^v//'
}

prepare() {
  cd "$pkgname"
}

build() {
  cd "$pkgname"

  python \
    -m build \
    --wheel \
    --no-isolation
}

check() {
  cd "$pkgname"
}

package() {
  cd "$pkgname"

  python \
    -m installer \
    --destdir="$pkgdir" \
    dist/*.whl

  install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
