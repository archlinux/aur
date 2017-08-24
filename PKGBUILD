# Maintainer: Hugo Osvaldo Barrera <hugo@barrera.io>

pkgname=sct
pkgver=1.0.0
pkgrel=1
pkgdesc="Set color temperature"
arch=('i686' 'x86_64')
url="http://www.tedunangst.com/flak/post/sct-set-color-temperature"
license=('Public Domain')
depends=()
makedepends=()
source=("http://www.tedunangst.com/flak/files/sct.c")
md5sums=('1d110264e8a13f7f9259643c2fa402b4')
# Upstream uses an invalid cert. This is okay since we validate md5sum:
DLAGENTS=("http::/usr/bin/curl -Ok")

build() {
  cd "$srcdir/"

  cc -std=c99 -O2 -I /usr/X11R6/include -o sct sct.c -L /usr/X11R6/lib -lm -lX11 -lXrandr
}

package() {
  cd "$srcdir/"
  install -Dm 755 sct "$pkgdir/usr/bin/sct"
}
