# $Id: PKGBUILD 194152 2016-10-31 13:48:24Z spupykin $
# Maintainer: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Maintainer: Corrado Primier <bardo@aur.archlinux.org>

pkgname=perl-gstreamer-interfaces
pkgver=0.06
pkgrel=9
pkgdesc="GStreamer::Interfaces"
arch=('i686' 'x86_64')
url="http://search.cpan.org/dist/GStreamer-Interfaces"
license=('GPL' 'PerlArtistic')
depends=('glib-perl' 'gstreamer0.10-base' 'perl-extutils-pkgconfig' 'perl-gstreamer' 'perl-extutils-depends')
options=('!emptydirs')
source=("http://www.cpan.org/authors/id/T/TS/TSCH/GStreamer-Interfaces-${pkgver}.tar.gz")
md5sums=('aa9583a484fa6829935b360887ecda45')

build() {
  cd  GStreamer-Interfaces-${pkgver}

  PERL_MM_USE_DEFAULT=1 perl Makefile.PL INSTALLDIRS=vendor

  make
}

package() {
  cd  GStreamer-Interfaces-${pkgver}

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
