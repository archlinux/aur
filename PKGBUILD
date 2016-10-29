# Maintainer: Zhuoyun Wei <wzyboy@wzyboy.org>

pkgname=govpn
pkgver=7.0
pkgrel=1
pkgdesc="Simple secure free software DPI/censorship-resistant VPN daemon"
arch=('i686' 'x86_64' 'armv7h')
url="http://www.govpn.info/"
makedepends=('go')
license=('GPL')
source=(http://sourceforge.net/projects/${pkgname}/files/${pkgname}-${pkgver}.tar.xz)
sha256sums=('df85e42df1228e8cfa5d582daef9055323033630e12b0b26d7defbebb25dbc4c')

build() {
  make -C ${pkgname}-${pkgver}
}

package() {
  cd $srcdir/$pkgname-${pkgver}
  make DESTDIR=$pkgdir PREFIX=/usr install-strip
  mv $pkgdir/usr/info $pkgdir/usr/share/info  # BSD -> Linux
  install -Dm644 doc/${pkgname}.html/* $pkgdir/usr/share/doc/$pkgname/
  install -Dm644 COPYING $pkgdir/usr/share/licenses/$pkgname/COPYING
}
