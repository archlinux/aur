# $Id: PKGBUILD 266875 2017-11-15 14:29:11Z foutrelis $
# Maintainer: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: ice-man <icemanf@gmail.com>

pkgname=sisctrl
pkgver=0.0.20051202
pkgrel=7
arch=(x86_64)
pkgdesc="Display Control Panel for XFree86/X.org SiS driver"
makedepends=('pkgconfig')
depends=('gtk2' 'libxxf86vm' 'libxv')
url="http://www.winischhofer.eu/linuxsisvga.shtml"
license=("GPL")
source=(https://arch.p5n.pp.ru/~sergej/dl/2016/sisctrl-$pkgver.tar.gz)
sha256sums=('76855a8ff4631418374261613a273b082e0f56f29aa083a2197c5350688611f1')

build() {
  cd "$srcdir"/$pkgname-$pkgver

  if [ -e /usr/lib/libXv.so ]; then
    LDFLAGS=-lm ./configure --with-xv-path=/usr/lib
  else
    LDFLAGS=-lm ./configure
  fi

  make
}

package() {
  cd "$srcdir"/$pkgname-$pkgver

  mkdir -p "$pkgdir"/usr/bin
  mkdir -p "$pkgdir"/usr/man/man1/ 
  mkdir -p "$pkgdir"/usr/share/pixmaps
  mkdir -p "$pkgdir"/usr/share/applications

  install -m 755 sisctrl "$pkgdir"/usr/bin
  cp sisctrl.1x sisctrl.1; gzip sisctrl.1
  install -m 644 sisctrl.1.gz "$pkgdir"/usr/man/man1/
  install -m 644 icons/32x32/sisctrl.xpm "$pkgdir"/usr/share/pixmaps
  install -m 644 icons/16x16/sisctrl.png "$pkgdir"/usr/share/pixmaps/sisctrl_16x16.png
  install -m 644 icons/32x32/sisctrl.png "$pkgdir"/usr/share/pixmaps/sisctrl_32x32.png
  install -m 644 icons/48x48/sisctrl.png "$pkgdir"/usr/share/pixmaps/sisctrl_48x48.png
  install -m 644 extra/sisctrl.desktop "$pkgdir"/usr/share/applications

  mv "$pkgdir"/usr/man "$pkgdir"/usr/share/
}
