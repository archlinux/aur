# Maintainer: Thiago L. A. Miller <thiago_leisrael@hotmail.com>
# Contributor: John D Jones III AKA jnbek <jnbek1972 -_AT_- g m a i l -_Dot_- com>
_distname=Config-MVP
pkgname=perl-config-mvp
pkgver=2.200012
pkgrel=1
pkgdesc="multivalue-property package-oriented configuration"
arch=('any')
url="https://metacpan.org/release/$_distname"
license=('PerlArtistic' 'GPL')
depends=('perl-class-load>=0.17'
         'perl-module-pluggable>=0'
         'perl-moose>=0.91'
         'perl-moosex-oneargnew>=0'
         'perl-params-util>=0'
         'perl-role-hasmessage>=0'
         'perl-role-identifiable>=0'
         'perl-throwable>=0'
         'perl-tie-ixhash>=0'
         'perl-try-tiny>=0')
makedepends=()
checkdepends=('perl-test-fatal>=0')
options=('!emptydirs')
source=("http://search.cpan.org/CPAN/authors/id/R/RJ/RJBS/$_distname-$pkgver.tar.gz")
md5sums=('93b12dacd4d2bd828d40a1d0e2c260fd')

build() {
  ( export PERL_MM_USE_DEFAULT=1 PERL5LIB=""                 \
      PERL_AUTOINSTALL=--skipdeps                            \
      PERL_MM_OPT="INSTALLDIRS=vendor DESTDIR='$pkgdir'"     \
      PERL_MB_OPT="--installdirs vendor --destdir '$pkgdir'" \
      MODULEBUILDRC=/dev/null

    cd "$_distname-$pkgver"
    /usr/bin/perl Makefile.PL
    make
  )
}

check() {
  cd "$_distname-$pkgver"
  ( export PERL_MM_USE_DEFAULT=1 PERL5LIB=""
    make test
  )
}

package() {
  cd "$_distname-$pkgver"
  make install
  find "$pkgdir" -name .packlist -o -name perllocal.pod -delete
}

# Local Variables:
# mode: shell-script
# sh-basic-offset: 2
# End:
# vim:set ts=2 sw=2 et:
