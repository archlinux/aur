# Contributor: Xyne <xyne at archlinux dot org>

pkgname=bindfs
pkgver=1.17.6
pkgrel=1
pkgdesc="A FUSE filesystem for mirroring a directory to another directory, similar to 'mount --bind', with permission settings."
arch=('i686' 'x86_64' 'armv6h' 'armv6l' 'armv7h')
url="http://bindfs.org/"
license=('GPL')
depends=('fuse3')
source=("http://bindfs.org/downloads/${pkgname}-${pkgver}.tar.gz")
sha512sums=('57a6cf3cdeb6a3ebdbcd59349e0f6fbcb60c4383a26ffc7be3b61152138d593f995501234cb5d4082e689b640de73efc60ce05219c3df1ff776498be27bfe0f1')


build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./autogen.sh
  ./configure --prefix=/usr
  make CPUOPTIMIZATIONS="${CFLAGS}"
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
  ln -s bindfs "$pkgdir/usr/bin/mount.bindfs"
  ln -s bindfs "$pkgdir/usr/bin/mount.fuse.bindfs"
}
