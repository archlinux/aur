# Maintainer: Steffen Weber <-boenki-gmx-de->

pkgname=webkitfltk
pkgver=0.4
pkgrel=1
pkgdesc="Port of Webkit to FLTK 1.3"
arch=('i686' 'x86_64')
url="http://fifth-browser.sourceforge.net"
license=('GPL3')
makedepends=('gperf' 'ruby' 'fltk' 'sqlite')
source=($pkgname-$pkgver.tar.gz::https://github.com/clbr/$pkgname/archive/v$pkgver.tar.gz)
md5sums=('d87640667c9bb5b44aeb30b868b3cc5c')

build() {
  cd "$pkgname-$pkgver"
  make -C Source/WTF/wtf
  make -C Source/JavaScriptCore gen
  make -C Source/JavaScriptCore
  make -C Source/WebCore
  make -C Source/WebKit/fltk
}

package() {
  cd "$pkgname-$pkgver"
  make -C Source/WebKit/fltk DESTDIR=$pkgdir install
}
