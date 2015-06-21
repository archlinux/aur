# Maintainer: pezcurrel <pezcurrel [at] tiscali.it>
# Contributor: Thomas Karmann <thomas [at] krmnn.de>

pkgname=xzoom
pkgver=0.3
pkgrel=4
pkgdesc="a screen magnifier"
arch=('i686' 'x86_64')
url="ftp://sunsite.unc.edu/pub/linux/libs/X/"
license=('GPL')
depends=('libxt' 'libxext')
makedepends=('imake')
source=(ftp://sunsite.unc.edu/pub/linux/libs/X/$pkgname-$pkgver.tgz
        ftp://ftp.acc.umu.se/mirror/cdimage/snapshot/Debian/pool/main/x/xzoom/xzoom_0.3-23.diff.gz)
md5sums=('c6ecc5fade34cf46cbe8c00b93d7ac78' 'd3a397e24aba7025f94e264fea0906d0')
build() {
  cd "$pkgname-$pkgver"
  patch -Np1 < "$srcdir/xzoom_0.3-23.diff"
  xmkmf
  sed -i "s@-O2@$CFLAGS@" ./Makefile
  make
}

package() {
  make -C "$pkgname-$pkgver" DESTDIR="$pkgdir" install install.man
}
