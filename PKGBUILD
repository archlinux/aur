# Maintainer: Beneldr <beneldr (dot) aur (at) gmail (dot) com>

pkgname=attic
pkgver=0.16
pkgrel=1
pkgdesc="A deduplicating backup program for efficient and secure backups."
arch=('i686' 'x86_64')
url="https://attic-backup.org/"
license=('BSD')
depends=('openssl' 'python-msgpack')
optdepends=('python-llfuse: Mounting backups as a FUSE filesystem')
makedepends=('python-sphinx')
source=(https://pypi.python.org/packages/source/A/Attic/Attic-$pkgver.tar.gz)
md5sums=('9c767c883f7f48bf95e7e5307ce6b5ea')

build() {
  cd "$srcdir/Attic-$pkgver/docs"
  PYTHONPATH=.. make man
}

package() {
  cd "$srcdir/Attic-$pkgver"
  install -D -m644 "docs/_build/man/attic-deduplicatingarchiver.1" "$pkgdir/usr/share/man/man1/attic.1"
  install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  python3 setup.py -q install --root="$pkgdir" --optimize=1
}
