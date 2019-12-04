# Maintainer: Slash
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Blackleg <blacklg@openaliasbox.org>
# Contributor: Nidhogg
# Contributor: juantascon

pkgname=python2-peewee
pkgver=3.9.5
pkgrel=4
pkgdesc="a little orm"
url="https://pypi.python.org/pypi/peewee/"
arch=('x86_64')
license=('MIT')
depends=('python2')
makedepends=('python2-setuptools' 'cython2' 'sqlite')
checkdepends=('python2-apsw' 'python2-flask' 'python2-psycopg2')
optdepends=('python2-psycopg2: for PostgreSQL database support')
source=("$pkgname-$pkgver.tar.gz::https://github.com/coleifer/peewee/archive/$pkgver.tar.gz")
sha512sums=('6b249f1fade196403a2dbb41125ca08590d834b588978387ed0d40ea51c32ac93fa23167e1fffe8e665c64b5254937c82f4cccc318b36dc0e4fdfd1d4c50ee35')

build() {
  cd "$srcdir"/peewee-$pkgver
  python2 setup.py build
}

check() {
  cd "$srcdir"/peewee-$pkgver
  python2 runtests.py
}

package() {
  cd "$srcdir"/peewee-$pkgver
  python2 setup.py install --root="$pkgdir" --optimize=1
  install -D -m644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE

  mv "$pkgdir"/usr/bin/pwiz{,2}.py
}
