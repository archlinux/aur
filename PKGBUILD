# Maintainer: Thiago L. A. Miller <thiago_leisrael@hotmail.com>
# Contributor: John D Jones III <jnbek1972 -_AT_- g m a i l -_Dot_- com>
_distname=Dist-Zilla-Plugin-Test-MinimumVersion
pkgname=perl-dist-zilla-plugin-test-minimumversion
pkgver=2.000010
pkgrel=1
pkgdesc="Author tests for minimum required versions"
arch=('any')
license=('PerlArtistic' 'GPL')
depends=('perl>=5.008'
         'perl-data-section>=0.004'
         'perl-dist-zilla>=4'
         'perl-moose>=0'
         'perl-sub-exporter-formethods>=0'
         'perl-namespace-autoclean>=0')
makedepends=()
checkdepends=('perl-dist-zilla>=0'
              'perl-test-minimumversion>=0'
              'perl-test-output>=0')
options=('!emptydirs')
url="https://metacpan.org/release/$_distname"
source=("https://cpan.metacpan.org/authors/id/E/ET/ETHER/$_distname-$pkgver.tar.gz")
md5sums=('c7393f092ea58937794de35221e7b470')

build() {
  ( export PERL_MM_USE_DEFAULT=1 PERL5LIB=""                 \
      PERL_AUTOINSTALL=--skipdeps                            \
      PERL_MM_OPT="INSTALLDIRS=vendor DESTDIR='$pkgdir'"     \
      PERL_MB_OPT="--installdirs vendor --destdir '$pkgdir'" \
      MODULEBUILDRC=/dev/null                                \
      PERL_MM_FALLBACK_SILENCE_WARNING=1

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
