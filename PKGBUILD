# Contributor: Xyne <xyne at archlinux dot org>

pkgname=bindfs
pkgver=1.17.1
pkgrel=3
pkgdesc="A FUSE filesystem for mirroring a directory to another directory, similar to 'mount --bind', with permission settings."
arch=('i686' 'x86_64' 'armv6h' 'armv6l' 'armv7h')
url="http://bindfs.org/"
license=('GPL')
depends=('fuse3')
source=("http://bindfs.org/downloads/${pkgname}-${pkgver}.tar.gz")
sha512sums=('9e7627d6fbb1348136e0716d5729cbc4951cd087efeff884d7ddc86429e3cd6e01b4f0a5b469ffa112421be1213dccc4723ab28f8db4b2f7d19525de705ffc77')


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
