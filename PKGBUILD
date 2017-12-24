# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=('python-sqlalchemy-git' 'python2-sqlalchemy-git')
pkgver=1.2.0rc11294.1abc8e550
pkgrel=2
pkgdesc="Python SQL toolkit and Object Relational Mapper"
arch=('i686' 'x86_64')
url="http://www.sqlalchemy.org"
license=('custom:MIT')
depends=('python')
makedepends=('git' 'python-setuptools')
source=("git+https://bitbucket.org/zzzeek/sqlalchemy.git")
md5sums=('SKIP')

pkgver() {
  cd sqlalchemy
  printf 1.2.0rc%s.%s "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cp -r sqlalchemy sqlalchemy2
}

build() {
  cd sqlalchemy
  python setup.py build

  cd "$srcdir"/sqlalchemy2
  python2 setup.py build
}

package_python-sqlalchemy-git() {
  provides=("python-sqlalchemy=$pkgver")
  conflicts=('python-sqlalchemy')
  cd sqlalchemy
  python setup.py install --root="$pkgdir"
  install -D -m644 LICENSE \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

package_python2-sqlalchemy-git() {
  provides=("python2-sqlalchemy=$pkgver")
  conflicts=('python2-sqlalchemy')
  cd sqlalchemy2
  python2 setup.py install --root="$pkgdir"
  install -D -m644 LICENSE \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
