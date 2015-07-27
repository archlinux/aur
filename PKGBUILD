# Maintainer : chrisl echo archlinux@c2h0r1i2s4t5o6p7h8e9r-l3u4n1a.com|sed 's/[0-9]//g'

pkgname=mlvwm
pkgver=0.9.1
pkgrel=2
pkgdesc='Macintosh-Like Virtual Window Manager, it attempts to emulate the pre-Mac OS X Macintosh look and feel in its layout and window design.'
arch=('i686' 'x86_64')
url="http://www2u.biglobe.ne.jp/~y-miyata/mlvwm.html"
license=('mit')
makedepends=('imake')
source=(http://www2u.biglobe.ne.jp/~y-miyata/mlvwm/mlvwm091.tar.gz)
md5sums=('0ac2a6f9981742b05509f7b8d00a7e52')

build() {
  cd mlvwm091
  xmkmf -a
  make
  #make PREFIX="$pkgdir"/usr BINARY=$pkgname install man
}
package () {
  cd mlvwm091
  sed -n '1,34 p'< mlvwm/mlvwm.c >license
  mkdir -p "$pkgdir"/usr/share/licenses/$pkgname/
  mkdir -p "$pkgdir"/usr/share/man/man1/
  mkdir -p "$pkgdir"/usr/bin
  mkdir -p "$pkgdir"/usr/share/$pkgname
  cp -R sample_rc/Mlvwmrc* "$pkgdir"/usr/share/$pkgname
  install -m755 mlvwm/mlvwm "$pkgdir"/usr/bin/$pkgname
  install -c -m444 man/mlvwm._man "$pkgdir"/usr/share/man/man1/mlvwm.1x
  install -m644 license "$pkgdir"/usr/share/licenses/$pkgname/
}

