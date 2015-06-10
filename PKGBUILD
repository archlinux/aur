# Maintainer: Andrés Cordero <arch@andrew67.com>
# Contributor: Jens Pranaitis <jens@chaox.net>
pkgname=mdk3
pkgver=v6
pkgdesc="WLAN penetration tool"
pkgrel=5
arch=("i686" "x86_64")
license=('GPL')
url="http://aspj.aircrack-ng.org/"
makedepends=('sed')
source=(http://aspj.aircrack-ng.org/$pkgname-$pkgver.tar.bz2)
md5sums=('67705a814ded2a2e6f70522ca0dc6da9')
build() {
  cd "${srcdir}"/$pkgname-$pkgver
  sed -i -e "s:/usr/local:/usr:" Makefile
  sed -i "s|-g -O3|$CFLAGS|g" Makefile
  make -C osdep || return 1
  make || return 1
}
package() {
  cd "${srcdir}"/$pkgname-$pkgver
  make DESTDIR="${pkgdir}/" install || return 1
  mv ${pkgdir}/usr/sbin ${pkgdir}/usr/bin || return 1
}
