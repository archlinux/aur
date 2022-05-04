# Maintainer : int <int [ate] arcor [dot] de>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-webservice-ils'
pkgver='0.18'
pkgrel='1'
pkgdesc="Perl/CPAN Module WebService::ILS: Standardised library discovery/circulation services"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-class-tiny' 'perl-http-message' 'perl-hash-merge' 'perl-json' 'perl-modern-perl' 'perl-uri' 'perl-libwww' 'perl>=5.8.1')
makedepends=('perl-module-build-tiny')
url='https://metacpan.org/release/WebService-ILS'
source=("http://search.cpan.org/CPAN/authors/id/S/SR/SRDJAN/WebService-ILS-$pkgver.tar.gz")
md5sums=('8a3ccf731ec146b3af343c0ac4058a01')
sha512sums=('53f217998c573e2df8b79c317542908569ec91ee1b498064fa5d8bb61b88d1a1be8ed478510577fdcbfdac4edd8ddc84144d5144f015b698ca80291d30a5db03')
_distdir="WebService-ILS-$pkgver"

build() {
  ( export PERL_MM_USE_DEFAULT=1 PERL5LIB=""                 \
      PERL_AUTOINSTALL=--skipdeps                            \
      PERL_MM_OPT="INSTALLDIRS=vendor DESTDIR='$pkgdir'"     \
      PERL_MB_OPT="--installdirs vendor --destdir '$pkgdir'" \
      MODULEBUILDRC=/dev/null

    cd "$srcdir/$_distdir"
    /usr/bin/perl Build.PL
    /usr/bin/perl Build
  )
}

check() {
  cd "$srcdir/$_distdir"
  ( export PERL_MM_USE_DEFAULT=1 PERL5LIB=""
    /usr/bin/perl Build test
  )
}

package() {
  cd "$srcdir/$_distdir"
  /usr/bin/perl Build install

  find "$pkgdir" "(" -name .packlist -o -name perllocal.pod ")" -delete
}

# Local Variables:
# mode: shell-script
# sh-basic-offset: 2
# End:
# vim:set ts=2 sw=2 et:
