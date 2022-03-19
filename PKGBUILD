# Maintainer : Evan
# Contributor: Chris L

pkgname=mlvwm
pkgver=0.9.4
pkgrel=3
pkgdesc='Unoffical package for Macintosh-Like Virtual Window Manager, it attempts to emulate the pre-Mac OS X Macintosh look and feel in its layout and window design.'
arch=('i686' 'x86_64')
url="http://www2u.biglobe.ne.jp/~y-miyata/mlvwm.html"
license=('mit')
depends=('libxpm')
makedepends=('imake')
source=(https://github.com/morgant/mlvwm/releases/download/0.9.4/mlvwm-0.9.4.tar.gz)
md5sums=('09cd57abecb65a2cc0bd35d623dae953')

build() {
  cd mlvwm-0.9.4
  cd man && xmkmf && cd -
  cd sample_rc && xmkmf && cd -
  cd mlvwm && xmkmf && cd -
  xmkmf
  make
  #make PREFIX="$pkgdir"/usr BINARY=$pkgname install man
}
package () {
  cd mlvwm-0.9.4
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

