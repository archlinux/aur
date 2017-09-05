# Maintainer: Brian Bidulock <bidulock at openss7 dot org>

pkgname=perl-tk-gbarr
pkgver=2.08
pkgrel=5
pkgdesc='Perl/CPAN Module Tk::TFrame,Cloth,NumEntry,NumEntryPlain,FireButton'
arch=('any')
url='http://metacpan.org/release/Tk-GBARR'
license=('GPL' 'PerlArtistic')
options=('!emptydirs')
source=("http://cpan.metacpan.org/authors/id/S/SR/SREZIC/Tk-GBARR-$pkgver.tar.gz")
provides=('perl-tk-tframe')
conflicts=('perl-tk-tframe')
depends=()
md5sums=('8791dc6ddba154ccb9b6a54e8ad11351')

build() {
  cd "$srcdir/Tk-GBARR-$pkgver"

  # install module in vendor directories
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
  cd "$srcdir/Tk-GBARR-$pkgver"
  make install DESTDIR="$pkgdir/"

  #remove perllocal.pod and .packlist
  find "$pkgdir" -name perllocal.pod -delete
  find "$pkgdir" -name .packlist -delete
  _perl_depends
}
