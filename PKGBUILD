# Maintainer: Steffen Weber <-boenki-gmx-de->

pkgname=webkitfltk
pkgver=0.5.1
pkgrel=1
pkgdesc="Port of Webkit to FLTK 1.3"
arch=('i686' 'x86_64')
url="http://fifth-browser.sourceforge.net"
license=('GPL3')
makedepends=('gperf' 'ruby' 'fltk' 'sqlite')
source=($pkgname-$pkgver.tar.gz::https://github.com/clbr/$pkgname/archive/v$pkgver.tar.gz
        $pkgname-fix-compilation1.patch::https://github.com/clbr/webkitfltk/commit/6db7be57eb6f633d63fb90397adb21c6247ab410.patch
        $pkgname-fix-compilation2.patch::https://github.com/clbr/webkitfltk/commit/83626b77fc7d8fae005fd4575dd85dbb0f243081.patch)
md5sums=('34038bdd111c34f19cb07a6fabe4fb2e'
         'ad4fc5e9cf59f734ced9b92a0f48c8c6'
         'a7d86e66857354543b4e45da2b31c5b3')

prepare() {
  cd "$pkgname-$pkgver"
  patch -p1 -i ../$pkgname-fix-compilation1.patch
  patch -p1 -i ../$pkgname-fix-compilation2.patch
}

build() {
  cd "$pkgname-$pkgver"
  make -C Source/bmalloc/bmalloc
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
