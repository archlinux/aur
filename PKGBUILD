# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=perl-cpanel-json-xs
pkgver=4.07
pkgrel=1
pkgdesc="cPanel fork of JSON::XS, fast and correct serializing"
arch=('i686' 'x86_64')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl')
url='https://metacpan.org/release/Cpanel-JSON-XS'
source=("https://cpan.metacpan.org/authors/id/R/RU/RURBAN/Cpanel-JSON-XS-$pkgver.tar.gz")
sha512sums=('f8136702c7da4c04d210025ee6c9e5095c07f67012f1ad2f35e8dcce204bd826569c036f87e50e34b30c461a149cba4f4da66ee60e30c9f7e5f402fadf529a57')
_distdir="Cpanel-JSON-XS-$pkgver"

build() {
  export PERL_MM_USE_DEFAULT=1 PERL5LIB=""                 \
	 PERL_AUTOINSTALL=--skipdeps                            \
	 PERL_MM_OPT="INSTALLDIRS=vendor DESTDIR='$pkgdir'"     \
	 PERL_MB_OPT="--installdirs vendor --destdir '$pkgdir'" \
	 MODULEBUILDRC=/dev/null
  
  cd "$_distdir"
  /usr/bin/perl Makefile.PL
  make
}

check() {
  cd "$_distdir"
  export PERL_MM_USE_DEFAULT=1 PERL5LIB=""
  make test
}

package() {
  cd "$_distdir"
  make install 
  find "$pkgdir" -name .packlist -o -name perllocal.pod -delete
}
