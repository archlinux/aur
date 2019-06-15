# Contributor: Xyne <xyne at archlinux dot us>

pkgname=bindfs
pkgver=1.14.0
pkgrel=1
pkgdesc="A FUSE filesystem for mirroring a directory to another directory, similar to 'mount --bind', with permission settings."
arch=('i686' 'x86_64' 'armv6h' 'armv6l' 'armv7h')
url="http://bindfs.org/"
license=('GPL')
depends=('fuse')
source=("http://bindfs.org/downloads/${pkgname}-${pkgver}.tar.gz")
sha512sums=('0efe0a66a0e2e7b9c463dbb76ef6c33797c5e6ea92c4d84c5ecf579dcbc560b83107e8a6d29c2e395cf2294308aa0bfbdf000e3c47d0ec823b86a90b394f0dbe')


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
