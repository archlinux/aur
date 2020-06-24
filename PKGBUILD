# Maintainer: Brian Bidulock <bidulock@openss7.org>
pkgname=perl-spread
_realname=Spread
pkgver=3.17.4.4
pkgrel=12
pkgdesc="Perl extension for the Spread group communication system"
arch=('i686' 'x86_64')
url="http://search.cpan.org/~jesus/Spread-3.17.4.4/Spread.pm"
license=('LGPL' 'PerlArtistic')
depends=('perl' 'gtk2-perl' 'perl-extutils-depends' 'perl-extutils-pkgconfig' 'libunique' 'spread-daemon')
options=('!emptydirs')
source=(http://search.cpan.org/CPAN/authors/id/J/JE/JESUS/Spread-$pkgver.tar.gz)
md5sums=('751314b7494530ad8feff2c10ac23010')

build() {
  cd  $srcdir/$_realname-$pkgver
  PERL_MM_USE_DEFAULT=1 perl Makefile.PL INSTALLDIRS=vendor
  make
}
_perl_depends() {
# template start; name=perl-binary-module-dependency; version=1;
if [[ $(find "$pkgdir/usr/lib/perl5/" -name "*.so") ]]; then
	_perlver_min=$(perl -e '$v = $^V->{version}; print $v->[0].".".($v->[1]);')
	_perlver_max=$(perl -e '$v = $^V->{version}; print $v->[0].".".($v->[1]+1);')
	depends+=("perl>=$_perlver_min" "perl<$_perlver_max")
fi
# template end;
}
package() {
  cd  $srcdir/$_realname-$pkgver
  make install DESTDIR=$pkgdir
  find $pkgdir -name '.packlist' -delete
  find $pkgdir -name '*.pod' -delete
  _perl_depends
}
