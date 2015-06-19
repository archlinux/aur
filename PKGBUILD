# Maintainer: Jonathan Liu <net147@gmail.com>
pkgname=nfsshell
pkgver=19980519
pkgrel=1
pkgdesc="Userland NFS command tool"
arch=('i686' 'x86_64')
url="http://www.paramecium.org/~leendert/"
license=('custom')
depends=('readline')
makedepends=()
source=("http://www.cs.vu.nl/pub/leendert/$pkgname.tar.gz"
        "gcc.patch"
        "LICENSE")
md5sums=('d447235518691fc3176ce89a6d836ce7'
         '33481c081308673963d52762febe0cc2'
         'd1305abf7d53b470f136495cfc1480ae')

build() {
  cd "$srcdir/nfs"

  patch -Np1 -i "$srcdir/gcc.patch" || return 1
  make
}

package() {
  cd "$srcdir/nfs"

  install -D -m755 nfs "$pkgdir/usr/bin/nfsshell"
  install -D -m644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:
