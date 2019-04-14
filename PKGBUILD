# Contributor: Xyne <xyne at archlinux dot us>

pkgname=bindfs
pkgver=1.13.11
pkgrel=1
pkgdesc="A FUSE filesystem for mirroring a directory to another directory, similar to 'mount --bind', with permission settings."
arch=('i686' 'x86_64' 'armv6h' 'armv6l' 'armv7h')
url="http://bindfs.org/"
license=('GPL')
depends=('fuse')
source=("http://bindfs.org/downloads/${pkgname}-${pkgver}.tar.gz")
sha512sums=('53b27e42ab7c117e28275dbeb23e43dceba86838ad54b2b8ae3c6e7b3631d0356597559d0746f2cd8363226ffb62bff2461d7a227ff82578f1d47c4b19bdd3f2')


build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./autogen.sh
  ./configure --prefix=/usr
  make CPUOPTIMIZATIONS="${CFLAGS}"
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
}
