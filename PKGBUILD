# $Id: PKGBUILD 194152 2016-10-31 13:48:24Z spupykin $
# Maintainer: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Corrado Primier <bardo@aur.archlinux.org>

pkgname=perl-gtk2-webkit
pkgver=0.09
pkgrel=7
pkgdesc="Gtk2::WebKit"
arch=('i686' 'x86_64')
url="http://search.cpan.org/dist/Gtk2-WebKit"
license=('GPL' 'PerlArtistic')
depends=('perl' 'gtk2-perl' 'webkitgtk2' 'perl-extutils-depends' 'perl-extutils-pkgconfig')
options=('!emptydirs')
source=(http://www.cpan.org/authors/id/F/FL/FLORA/Gtk2-WebKit-${pkgver}.tar.gz)
md5sums=('e696fc2b15d6189370e19bce9a9e56f3')

build() {
  cd Gtk2-WebKit-${pkgver}
  PERL_MM_USE_DEFAULT=1 perl Makefile.PL INSTALLDIRS=vendor
  make
}

package() {
  cd Gtk2-WebKit-${pkgver}
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
