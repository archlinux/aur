# Maintainer: Zhuoyun Wei <wzyboy@wzyboy.org>

pkgname=govpn
pkgver=3.1
pkgrel=1
pkgdesc="Simple secure free software VPN daemon"
arch=('i686' 'x86_64')
url="http://www.cypherpunks.ru/govpn/"
makedepends=('go')
license=('GPL')
source=(http://sourceforge.net/projects/${pkgname}/files/${pkgname}-${pkgver}.tar.xz)
noextract=("${pkgver}.tar.xz")
sha256sums=('4034a67eb472e33760ed1783ca871f531c3a6be99b9bd6213f4f83c1147c344b')

build() {
  mkdir -p $pkgname/src
  tar xfC ${pkgname}-${pkgver}.tar.xz $pkgname/src
  mv $pkgname/src/$pkgname-$pkgver $pkgname/src/$pkgname
  export GOPATH=$(pwd)/$pkgname:$GOPATH
  cd $pkgname/src/$pkgname
  make
}

package() {
  cd $srcdir/$pkgname/src/$pkgname
  install -D govpn-client $pkgdir/usr/bin/govpn-client
  install -D govpn-server $pkgdir/usr/bin/govpn-server
  install -D govpn-verifier $pkgdir/usr/bin/govpn-verifier
  mkdir -p $pkgdir/usr/share/doc/$pkgname/
  install -Dm644 doc/${pkgname}.html/* $pkgdir/usr/share/doc/$pkgname/
  install -Dm644 COPYING $pkgdir/usr/share/licenses/$pkgname/COPYING
  mkdir -p $pkgdir/usr/share/$pkgname/
  install -Dm755 utils/newclient.sh $pkgdir/usr/share/$pkgname/newclient.sh
  install -Dm755 utils/storekey.sh $pkgdir/usr/share/$pkgname/storekey.sh
}
