# Maintainer: Vlad M. <vlad@archlinux.net>

pkgname=borgbackup
_pkgname=borg
pkgver=0.28.2
pkgrel=1
pkgdesc="Deduplicating backup program with compression and authenticated encryption"
url="https://borgbackup.github.io/borgbackup/"
license=('BSD')
arch=('i686' 'x86_64')
depends=('acl'
         'lz4'
         'openssl'
         'python-msgpack'
         'python-setuptools'
         'xz')
optdepends=('openssh: repositories on remote hosts'
            'python-llfuse: Mounting backups as a FUSE filesystem')
makedepends=('python-sphinx')
source=("https://pypi.python.org/packages/source/b/$pkgname/$pkgname-$pkgver.tar.gz")
sha256sums=('cf8ee95758242065556ca500e49c62ba48ae62895d7dcf44e49088a0c22af0eb')

build() {
  cd "$pkgname-$pkgver/docs"
  make man
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm644 "docs/_build/man/borg-deduplicatingarchiver.1" "$pkgdir/usr/share/man/man1/borg.1"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  python setup.py -q install --root="$pkgdir" --optimize=1
}
