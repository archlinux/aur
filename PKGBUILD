# $Id: PKGBUILD 266875 2017-11-15 14:29:11Z foutrelis $
# Maintainer: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Maintainer: Giovanni Scafora <linuxmania@gmail.com>
# Contributor: Alessio 'mOLOk' Bolognino <themolok@gmail.com>

pkgname=ussp-push
pkgver=0.11
pkgrel=6
pkgdesc="OBEX object pusher for Linux"
arch=('x86_64')
license=('GPL2')
url="http://xmailserver.org/ussp-push.html"
depends=('openobex')
source=(http://xmailserver.org/$pkgname-$pkgver.tar.gz
	build-fix.patch)
md5sums=('5c44983ee27809867041feff6bb4423a'
         'b9020ea9bb34b811206366b407f5e3cd')

prepare() {
  cd "$srcdir"/$pkgname-$pkgver
  patch -p1 <"$srcdir"/build-fix.patch
}

build() {
  cd "$srcdir"/$pkgname-$pkgver
  export LDFLAGS="$LDFLAGS -lopenobex-apps-common"
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir"/$pkgname-$pkgver
  make DESTDIR="$pkgdir" install
}
