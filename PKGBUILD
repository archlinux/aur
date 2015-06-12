# $Id: PKGBUILD 8735 2008-08-16 04:57:16Z eric $
# Maintainer: Mick Elliot <micke@sfu.ca>
# Contributor: Damir Perisa <damir.perisa@bluewin.ch>

pkgname=muscle
pkgver=3.8.31
pkgrel=1
pkgdesc="multiple sequence comparison by log-expectation"
arch=('i686' 'x86_64')
url="http://www.drive5.com/muscle/"
license=('custom')
source=(http://www.drive5.com/muscle/downloads${pkgver}/muscle${pkgver}_src.tar.gz LICENSE)
md5sums=('f767f00fd15f0c5db944d41936779e10'
         '57cfb6975987af93c89977f084d53b72')

build() {
  cd "$srcdir/muscle${pkgver}/src"
  if [ "${CARCH}" = "i686" ]; then
    make CFLAGS=" -march=i686 -mtune=generic -O2 -pipe" LDLIBS=" -lm"
  else
    make CFLAGS=" -march=x86-64 -mtune=generic -O2 -pipe" LDLIBS=" -lm"
  fi
}

package() {
  cd "$srcdir/muscle${pkgver}/src"
  install -D -m755 muscle "$pkgdir/usr/bin/muscle"
  install -D -m644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
 
