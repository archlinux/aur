# $Id: PKGBUILD 194152 2016-10-31 13:48:24Z spupykin $
# Maintainer: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Corrado Primier <bardo@aur.archlinux.org>

pkgname=perl-gstreamer
pkgver=0.20
pkgrel=3
pkgdesc="Interface to the GStreamer library"
arch=('i686' 'x86_64')
url="http://search.cpan.org/dist/GStreamer"
license=('GPL' 'PerlArtistic')
depends=('glib-perl>=1.180' 'gstreamer0.10' 'perl-extutils-pkgconfig>=1.07' 'perl-extutils-depends>=0.205')
options=('!emptydirs')
source=(http://search.cpan.org/CPAN/authors/id/X/XA/XAOC/GStreamer-$pkgver.tar.gz)
md5sums=('c848ea3dca4017953755f787dc8add8f')

build() {
  cd  GStreamer-${pkgver}
  PERL_MM_USE_DEFAULT=1 perl Makefile.PL INSTALLDIRS=vendor
  make
}

package() {
  cd  GStreamer-${pkgver}
  make install DESTDIR="$pkgdir"
  find "$pkgdir" -name '.packlist' -delete
  find "$pkgdir" -name '*.pod' -delete
# template start; name=perl-binary-module-dependency; version=1;
if [[ $(find "$pkgdir/usr/lib/perl5/" -name "*.so") ]]; then
	_perlver_min=$(perl -e '$v = $^V->{version}; print $v->[0].".".($v->[1]);')
	_perlver_max=$(perl -e '$v = $^V->{version}; print $v->[0].".".($v->[1]+1);')
	depends+=("perl>=$_perlver_min" "perl<$_perlver_max")
fi
# template end;
}
