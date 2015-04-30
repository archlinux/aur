# Maintainer: Zhuoyun Wei <wzyboy@wzyboy.org>

pkgname=govpn
pkgver=2.3
pkgrel=2
pkgdesc="Simple secure free software VPN daemon"
arch=('i686' 'x86_64')
url="http://www.cypherpunks.ru/govpn/"
makedepends=('go')
license=('GPL')
source=(http://sourceforge.net/projects/${pkgname}/files/${pkgname}-${pkgver}.tar.xz)
noextract=("${pkgver}.tar.xz")
sha256sums=('92986ec6d6da107c6cc1143659e5a154cd19b8f2ede5fa7f5ccc4525ae468e97')

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
  mkdir -p $pkgdir/usr/share/doc/$pkgname/
  install -Dm644 doc/${pkgname}.html/* $pkgdir/usr/share/doc/$pkgname/
  install -Dm644 COPYING $pkgdir/usr/share/licenses/$pkgname/COPYING
  mkdir -p $pkgdir/usr/share/$pkgname/
  install -Dm755 utils/newclient.sh $pkgdir/usr/share/$pkgname/newclient.sh
}
