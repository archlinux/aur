# Maintainer: Rikard Falkeborn <rikard.falkeborn@gmail.com>
# Contributor: Alex Tercete <alextercete at gmail.com>

pkgname=xcircuit-devel
pkgver=3.9.38
pkgrel=1
pkgdesc="A program for drawing publishable-quality electrical circuit schematic diagrams (development version)"
arch=('i686' 'x86_64')
url="http://opencircuitdesign.com/xcircuit/"
depends=('tk' 'libxpm' 'zlib')
makedepends=('chrpath')
license=('GPL2')
conflicts=('xcircuit')
source=("http://opencircuitdesign.com/xcircuit/archive/xcircuit-${pkgver}.tgz")
md5sums=('2007dd5eed6f8df1775bb27afeccb793')

build() {
  cd "${srcdir}/xcircuit-${pkgver}"
  ./configure --prefix=/usr --with-tcl=/usr/lib --with-tk=/usr/lib --mandir=/usr/share/man
  make
}

package() {
  cd $srcdir/xcircuit-$pkgver
  make DESTDIR="$pkgdir" install
  mkdir -p "$pkgdir/usr/share/man/man1"
  mv "$pkgdir/usr/lib/xcircuit-3.9/man/"* "$pkgdir/usr/share/man/man1/"
  rm -rf "$pkgdir/usr/lib/xcircuit-3.9/man/"
  chrpath -d "$pkgdir/usr/lib/xcircuit-3.9/xcircexec"
}
