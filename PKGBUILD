# Maintainer: pezcurrel <pezcurrel [at] tiscali.it>
# Contributor: Thomas Karmann <thomas [at] krmnn.de>

pkgname=xzoom
pkgver=0.3
pkgrel=7
pkgdesc="A screen magnifier"
arch=("i686" "x86_64")
url="ftp://sunsite.unc.edu/pub/linux/libs/X/"
license=("GPL")
depends=("libxt" "libxext")
makedepends=("imake")
source=("http://webdiis.unizar.es/pub/unix/X11/xzoom-0.3.tgz" "xzoom.diff")
md5sums=("c6ecc5fade34cf46cbe8c00b93d7ac78" "0de8aa268abad0db2d562ebd491da010")

build() {
  cd "$pkgname-$pkgver"
  patch -Np1 < "$srcdir/xzoom.diff"
  xmkmf
  sed -i "s@-O2@$CFLAGS@" ./Makefile
  make
}

package() {
  make -C "$pkgname-$pkgver" DESTDIR="$pkgdir" install install.man
}
