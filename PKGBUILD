# Maintainer: Michael Schubert <mschu.dev at gmail>
# Contributor: Mick Elliot <micke@sfu.ca>
# Contributor: Damir Perisa <damir.perisa@bluewin.ch>
pkgname=muscle
pkgver=3.8.1551
pkgrel=1
pkgdesc="multiple sequence comparison by log-expectation"
arch=('i686' 'x86_64')
url="http://www.drive5.com/muscle/"
license=('custom')
source=(http://www.drive5.com/muscle/muscle_src_$pkgver.tar.gz LICENSE)
sha256sums=('c70c552231cd3289f1bad51c9bd174804c18bb3adcf47f501afec7a68f9c482e'
            '2ee887dede5d3ddb6fa65690e0afd8d1083d835522d9271450752df0cc2f6658')

build() {
  cd "$srcdir"
  if [ "${CARCH}" = "i686" ]; then
    make CFLAGS=" -march=i686 -mtune=generic -O2 -pipe" LDLIBS=" -lm"
  else
    make CFLAGS=" -march=x86-64 -mtune=generic -O2 -pipe" LDLIBS=" -lm"
  fi
}

package() {
  cd "$srcdir"
  install -D -m755 muscle "$pkgdir/usr/bin/muscle"
  install -D -m644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
 
