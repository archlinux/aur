# Maintainer: rtfreedman  (rob<d0t>til<d0t>freedman<aT>googlemail<d0t>com
# Contributor: Bernardo Barros <bbarros*AT*xsounds*DOT*org>

pkgname=lv2-ir
pkgver=1.3.2
pkgrel=2
pkgdesc="zero-latency, realtime, high performance signal convolver especially for creating reverb effects."
arch=('i686' 'x86_64')
url="http://factorial.hu/plugins/lv2/ir"
license=('GPL')
depends=('zita-convolver' 'libsamplerate' 'gtk2>=2.16')
provides=('ir-lv2')
conflicts=('ir-lv2')
groups=('lv2-plugins')
makedepends=('lv2' )

source=("http://factorial.hu/system/files/ir.lv2-${pkgver}.tar.gz")
md5sums=('01140e1f70e7f4949f502eafc1958bcd')

build() {
  cd "$srcdir/ir.lv2-${pkgver}"
  make
  make convert4chan
}

package() {
  cd "$srcdir/ir.lv2-${pkgver}"
  make PREFIX="$pkgdir/usr" install
  install -Dm755 convert4chan "$pkgdir/usr/bin/convert4chan"
  # fixed location
  sed -i 's/, but seem like its gone://' README
  sed -i  's@rhythminmind.net/1313@rhythminmind.net/STN@' README
  install -Dm644 README "${pkgdir}"/usr/share/doc/$pkgname/README
}
