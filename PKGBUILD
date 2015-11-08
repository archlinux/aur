# Maintainer: Vlad M. <vlad@archlinux.net>

pkgname=borgbackup
_pkgname=borg
pkgver=0.28.0
pkgrel=1
pkgdesc="Deduplicating backup program with compression and authenticated encryption"
url="https://borgbackup.github.io/borgbackup/"
license=('BSD')
arch=('i686' 'x86_64')
depends=('acl'
         'lz4'
         'openssl'
         'python-msgpack'
         'xz')
optdepends=('openssh: repositories on remote hosts'
            'python-llfuse: Mounting backups as a FUSE filesystem')
makedepends=('python-sphinx')
source=("https://pypi.python.org/packages/source/b/$pkgname/$pkgname-$pkgver.tar.gz")
sha256sums=('48498b73014d285d8ae16e9466f6a8ed6551ba78983d7e16baaeee25c2e2f4db')

build() {
  cd "$pkgname-$pkgver/docs"
  PYTHONPATH=.. make man
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm644 "docs/_build/man/borg-deduplicatingarchiver.1" "$pkgdir/usr/share/man/man1/borg.1"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  python setup.py -q install --root="$pkgdir" --optimize=1
}
