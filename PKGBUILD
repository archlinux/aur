# Maintainer: Vlad M. <vlad@archlinux.net>

pkgname=borgbackup
pkgver=0.23.0
pkgrel=1
pkgdesc="A deduplicating backup program for efficient and secure backups."
url="https://borgbackup.github.io/"
license=('BSD')
arch=('i686' 'x86_64')
depends=('acl'
         'openssl'
         'python-msgpack')
optdepends=('python-llfuse: Mounting backups as a FUSE filesystem')
makedepends=('python-sphinx')
source=("https://pypi.python.org/packages/source/b/$pkgname/$pkgname-$pkgver.tar.gz")
sha256sums=('2012595ce7dc28deb4215e3f58935afbe71275dca707df2ef9416d1c3fe6a61b')

build() {
  cd "$srcdir/$pkgname-$pkgver/docs"
  PYTHONPATH=.. make man
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -Dm644 "docs/_build/man/borg-deduplicatingarchiver.1" "$pkgdir/usr/share/man/man1/borg.1"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  python setup.py -q install --root="$pkgdir" --optimize=1
}
