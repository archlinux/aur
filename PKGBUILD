# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Blackleg <blacklg@openaliasbox.org>
# Contributor: Nidhogg
# Contributor: juantascon

pkgname=python2-peewee
pkgver=3.9.3
pkgrel=1
pkgdesc="a little orm"
url="https://pypi.python.org/pypi/peewee/"
arch=('x86_64')
license=('MIT')
depends=('python2')
makedepends=('python2-setuptools' 'cython2' 'sqlite')
checkdepends=('python2-apsw' 'python2-flask' 'python2-psycopg2')
optdepends=('python2-psycopg2: for PostgreSQL database support')
source=("$pkgbase-$pkgver.tar.gz::https://github.com/coleifer/peewee/archive/$pkgver.tar.gz")
sha512sums=('de7080104bad7c55cd8a0ee50bf86a1c5617870a1425f57122729b3810078f0adb70261e3c870e117bccc5f558576418d163677d174b53a7a4f079a0033df27a')

prepare() {
  cp -a peewee-$pkgver-py2
}

build() {
  cd "$srcdir"/peewee-$pkgver-py2
  python2 setup.py build
}

check() {
  cd "$srcdir"/peewee-$pkgver-py2
  python2 runtests.py
}

package() {

  cd "$srcdir"/peewee-$pkgver-py2
  python2 setup.py install --root="$pkgdir" --optimize=1
  install -D -m644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE

  mv "$pkgdir"/usr/bin/pwiz2.py
}
