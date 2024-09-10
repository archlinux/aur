# Maintainer: Alcubierre Drive <alcubierre-drive@github>
pkgname=geo-osm-tiles
pkgname_cap=Geo-OSM-Tiles
pkgver=0.04
pkgrel=3
pkgdesc="Utility that enables download of OSM tiles (downloadosmtiles.pl)"
arch=('any')
url="https://metacpan.org/release/ROTKRAUT/Geo-OSM-Tiles-0.04/view/downloadosmtiles.pl"
license=('Perl')
#groups=('base-devel')
depends=('perl' 'perl-yaml')
makedepends=('make')
source=("https://cpan.metacpan.org/authors/id/R/RO/ROTKRAUT/${pkgname_cap}-${pkgver}.tar.gz")
sha512sums=('bdb28b23176dfca07dc0b0bc21adbd7ce75f3dba965c05f920886c254a978ecc40b8ac65e2268f5ffb47d6df1038d59bc0817ccf91d9cdb277ce0492b6ace760')

build() {
    cd "$srcdir/${pkgname_cap}-$pkgver"
    PERL_USE_UNSAFE_INC=1 \
    PERL_MM_USE_DEFAULT=1 \
    perl Makefile.PL INSTALLDIRS=site
    make
}

package() {
    cd "$srcdir/${pkgname_cap}-$pkgver"
    make pure_install doc_install DESTDIR="$pkgdir"
    mkdir -p "$pkgdir/usr/bin"
    mv "$pkgdir/usr/bin/site_perl/downloadosmtiles.pl" "$pkgdir/usr/bin/downloadosmtiles"
    rmdir "$pkgdir/usr/bin/site_perl"
}
