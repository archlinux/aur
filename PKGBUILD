# Maintainer: Jose Riha <jose1711 gmail com>
# Contributor: jwmartnet

pkgname=gpx2map-git
_pkgname=gpx2map
pkgver=r41.98093e8
pkgrel=1
pkgdesc="Utility to read gps track (gpx) and writes Google Map or OSM mash-up"
arch=('any')
url="https://sd2k9.github.io/gpx2map/"
license=('GPL3')
depends=('perl-chart-gnuplot' 'perl-template-toolkit' 'perl-geo-distance' 'perl-xml-twig')
conflicts=('gpx2map')
source=("${_pkgname}"::'git+https://github.com/sd2k9/gpx2map.git')
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/${_pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd $srcdir/${_pkgname}
  mkdir -p ${pkgdir}/usr/{share/{doc/gpx2map,gpx2map},bin}
  install -Dm644 *.template "${pkgdir}/usr/share/gpx2map"
  install -Dm755 gpx2map "${pkgdir}/usr/share/gpx2map"
  install -Dm644 COPYING "$pkgdir/usr/share/licenses/$_pkgname/COPYING"
  install -m644 README.md gpx2map.html "$pkgdir/usr/share/doc/${_pkgname}"
  ln -s /usr/share/gpx2map/gpx2map ${pkgdir}/usr/bin/gpx2map
}
