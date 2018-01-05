# $Id: PKGBUILD 266875 2017-11-15 14:29:11Z foutrelis $
# Maintainer: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>

pkgname=delegate
pkgver=9.9.13
pkgrel=3
pkgdesc="Caching and converting multyprotocol proxy. For example, you may use it as NNTP web interface"
arch=('x86_64')
url="http://www.delegate.org/"
license=('GPL')
depends=('pam')
options=(!strip)
install=delegate.install
source=(ftp://ftp:ps790809%40inbox%2Eru@ftp.delegate.org/pub/DeleGate/delegate$pkgver.tar.gz
	ssl3.patch)
md5sums=('b617959aa785b751a6292dad7487c722'
         'de7ebae5f5ba97509dc26a19e8e0aaf1')

prepare() {
  cd "$srcdir"/$pkgname$pkgver
  patch -p1 <"$srcdir"/ssl3.patch
}

build() {
  cd "$srcdir"/$pkgname$pkgver
  make ADMIN="root@localhost" CFLAGS="$CFLAGS -Wno-narrowing"
}

package() {
  cd "$srcdir"/$pkgname$pkgver

  install -D -m0755 src/delegated "$pkgdir"/usr/bin/delegated

  install -D -m0755 subin/dgbind "$pkgdir"/usr/bin/dgbind
  install -D -m0755 subin/dgchroot "$pkgdir"/usr/bin/dgchroot
  install -D -m0755 subin/dgcpnod "$pkgdir"/usr/bin/dgcpnod
  install -D -m0755 subin/dgpam "$pkgdir"/usr/bin/dgpam

  install -D -m0644 doc/Manual.htm "$pkgdir"/usr/share/delegate/manual.htm
  install -D -m0644 doc/tutor-en.htm "$pkgdir"/usr/share/delegate/tutor-en.htm
}
