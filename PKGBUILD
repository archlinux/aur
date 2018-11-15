# Maintainer: Zhuoyun Wei <wzyboy@wzyboy.org>

pkgname=govpn
pkgver=7.5
pkgrel=1
pkgdesc="Simple secure free software DPI/censorship-resistant VPN daemon"
arch=('i686' 'x86_64' 'armv7h')
url="http://www.govpn.info/"
makedepends=('go')
license=('GPL')
source=(http://www.govpn.info/download/${pkgname}-${pkgver}.tar.xz)
sha256sums=('b0d303138a41083109b42576f52888ef17de3bc7a8016d062f43a34f795a8c80')

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
