# Maintainer: Vlad M. <vlad@archlinux.net>

pkgname=borgbackup
pkgver=0.26.0
pkgrel=1
pkgdesc="A deduplicating backup program for efficient and secure backups"
url="https://borgbackup.github.io/borgbackup"
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
sha256sums=('4c665d531a9e3138c67785de57bd440fb26e72b515080255782764269795dae0')

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
