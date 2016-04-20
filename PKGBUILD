# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>
pkgname=python2-sqlalchemy-git
pkgver=1.0.8.411.g8ab08cf
pkgrel=1
pkgdesc="Python SQL toolkit and Object Relational Mapper"
arch=('i686' 'x86_64')
url="http://www.sqlalchemy.org"
license=('custom:MIT')
depends=('python2')
makedepends=('git' 'python2-setuptools')
provides=("python2-sqlalchemy=$pkgver")
conflicts=('python2-sqlalchemy')
source=("git+https://bitbucket.org/zzzeek/sqlalchemy.git")
md5sums=('SKIP')
_gitname="sqlalchemy"

pkgver() {
  cd $srcdir/$_gitname
  git describe --tags | sed 's|[_-]|.|g'| cut -c5-
}

build() {
  cd "$srcdir/$_gitname"
  sed -i '1s+python+python2+' lib/sqlalchemy/testing/runner.py
  python2 setup.py build
}

package() {
  cd "$srcdir/$_gitname"
  python2 setup.py install --root="$pkgdir"
  install -D -m644 LICENSE \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
