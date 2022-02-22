# Maintainer: Michael Stanley <michael@stnley.io>
# Contributer: Hugo Osvaldo Barrera <hugo@barrera.io>

pkgname=sct
pkgver=1.0.0
pkgrel=1
pkgdesc="Set color temperature"
arch=('i686' 'x86_64')
url="http://www.tedunangst.com/flak/post/sct-set-color-temperature"
license=('Public Domain')
depends=()
makedepends=('libx11' 'libxrandr')
source=("https://www.tedunangst.com/flak/files/sct.c")
sha256sums=('0dda697ec3f4129d793f8896743d82be09934883f5aeda05c4a2193d7ab3c305')
# Upstream uses an invalid cert. This is acceptable since we validate
# checksums.
DLAGENTS=("https::/usr/bin/curl -Ok -sSL")

build() {
  cd "$srcdir/"

  cc -std=c99 -O2 -I /usr/X11R6/include -o sct sct.c -L /usr/X11R6/lib -lm -lX11 -lXrandr
}

package() {
  cd "$srcdir/"
  install -Dm 755 sct "$pkgdir/usr/bin/sct"
}
