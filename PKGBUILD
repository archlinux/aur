# Maintainer: Sam Whited <sam@samwhited.com>

pkgname=libraw16
pkgver=0.18.13
pkgrel=0
provides=("libraw=$pkgver", "$pkgname")
pkgdesc="A library for reading RAW files obtained from digital photo cameras (CRW/CR2, NEF, RAF, DNG, and others)"
arch=('x86_64')
url="https://www.libraw.org/"
license=(CDDL LGPL)
depends=(lcms2 jasper)
source=(https://www.libraw.org/data/LibRaw-$pkgver.tar.gz)
sha256sums=('cb1f9d0d1fabc8967d501d95c05d2b53d97a2b917345c66553b1abbea06757ca')

build() {
  cd LibRaw-$pkgver
  ./configure --prefix=/usr \
    --disable-examples \
    --docdir=/usr/doc/$pkgname \
    --includedir=/usr/include/libraw-$pkgver \
    --disable-static
  make
}

package() {
  cd LibRaw-$pkgver
  make DESTDIR="$pkgdir" install
  rm -rf "${pkgdir}"/usr/lib/{libraw{.a,_r.a,_r.so,.so},pkgconfig}
}
