# Maintainer: Gregor Robinson <gregor@fiatflux.co.uk>
# Contributor: Vitaliy Berdinskikh ur6lad[at]i.ua

pkgname=splat
pkgver=1.4.2
pkgrel=1
pkgdesc="A RF Signal Propagation, Loss, And Terrain analysis tool for the spectrum between 20 MHz and 20 GHz"
arch=('i686' 'x86_64')
url="http://www.qsl.net/kd2bd/splat.html"
depends=('gcc-libs' 'zlib' 'bzip2' 'gnuplot')
#optdepends=('gimp')
source=("http://www.qsl.net/kd2bd/splat-$pkgver.tar.bz2")
license=('GPL')
md5sums=('273558999105cd51d1e46eef4a570b7d')

prepare() {
  cd "$pkgname-$pkgver"
  sed -i -e s:' -march=$cpu':: build
  sed -i -e s:'-O3':"${CFLAGS}": build
  sed -i -e s:'-O3':"${CFLAGS}": utils/build
}
	
build() {
  cd "$pkgname-$pkgver"
  ./build all
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 splat "$pkgdir/usr/bin/splat"
  install -m755 utils/{citydecoder,usgs2sdf,srtm2sdf} -t "$pkgdir/usr/bin/"
  install -Dm644 docs/english/man/splat.1 "$pkgdir/usr/share/man/man1/splat.1"
  install -Dm644 docs/spanish/man/splat.1 "$pkgdir/usr/share/man/es/man1/splat_es.1"
  install -d "$pkgdir/usr/share/splat/data/"
  install -d "$pkgdir/usr/share/splat/docs/"
  install -m644 sample_data/* "$pkgdir/usr/share/splat/data/"
  install -Dm644 utils/README "$pkgdir/usr/share/splat/docs/README"
  install -Dm644 CHANGES "$pkgdir/usr/share/splat/docs/CHANGES"
}
