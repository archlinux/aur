# Maintainer: Vlad M. <vlad@archlinux.net>

pkgname=borgbackup
pkgver=0.24.0
pkgrel=1
pkgdesc="A deduplicating backup program for efficient and secure backups"
url="https://borgbackup.github.io/"
license=('BSD')
arch=('i686' 'x86_64')
depends=('acl'
         'openssl'
         'python-msgpack')
optdepends=('openssh: repositories on remote hosts'
            'python-llfuse: Mounting backups as a FUSE filesystem')
makedepends=('python-sphinx')
source=("https://pypi.python.org/packages/source/b/$pkgname/$pkgname-$pkgver.tar.gz")
sha256sums=('17a5ae18e6136679bbfb5459b6cde36c07c8498503d53c7d107832c3b6199628')

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
