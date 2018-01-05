# $Id: PKGBUILD 194152 2016-10-31 13:48:24Z spupykin $
# Maintainer: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Christoph Zeiler <archNOSPAM_at_moonblade.dot.org>

pkgname=bashdb
pkgver=4.3_0.9
pkgrel=4
pkgdesc="A debugger for Bash scripts loosely modeled on the gdb command syntax"
arch=('any')
url="http://bashdb.sourceforge.net/"
license=('GPL')
depends=('bash' 'python2-pygments' 'pygmentize')
source=(http://downloads.sourceforge.net/$pkgname/$pkgname-${pkgver/_/-}.tar.bz2 python2.patch)
md5sums=('2f2479933a4e19663349b66f87d0290a'
         '7e2fdd6ecb69cfd2cc2dba33c700c800')

prepare() {
  cd $pkgname-${pkgver//_/-}
  patch -Np1 -i "$srcdir"/python2.patch
  sed -i "s#'4.2' | '4.1'#'4.3' | '4.2' | '4.1'#" configure
}

build() {
  cd $pkgname-${pkgver//_/-}
  ./configure --prefix=/usr --disable-static -C
  make
}
package() {
  cd $pkgname-${pkgver//_/-}
  make DESTDIR="$pkgdir" install
  rm -f "$pkgdir"/usr/share/info/dir
}
