# Maintainer: George Rawlinson <george@rawlinson.net.nz>

pkgname=python-sqlalchemy2-stubs
pkgver=0.0.2a22
pkgrel=1
pkgdesc="PEP-484 typing stubs for SQLAlchemy 1.4"
arch=('any')
url="https://github.com/sqlalchemy/sqlalchemy2-stubs"
license=('MIT')
depends=('python')
makedepends=(
  'git'
  'python-setuptools'
  'python-pip'
  'python-typing_extensions'
)
provides=('python-sqlalchemy-stubs')
conflicts=('python-sqlalchemy-stubs')
_commit='d05f1127be535bdf221c4920c0e6811d08c4a3c2'
source=("$pkgname::git+$url.git#commit=$_commit")
b2sums=('SKIP')

pkgver() {
  cd "$pkgname"

  git describe --tags | sed 's/v//'
}

build() {
  cd "$pkgname"

  python setup.py build
}

package() {
  cd "$pkgname"

  python setup.py install --root="$pkgdir" --optimize=1 --skip-build

  # license
  install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
