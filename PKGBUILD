# Generator  : CPANPLUS::Dist::Arch 1.32
# Maintainer: András Wacha < awacha at gmail >

pkgname='perl-pdl-stats'
pkgver='0.81'
pkgrel='1'
pkgdesc="a collection of statistics modules in Perl Data Language, with a quick-start guide for non-PDL people."
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-pdl>=0')
makedepends=()
url='https://metacpan.org/release/PDL-Stats'
source=("http://search.cpan.org/CPAN/authors/id/E/ET/ETJ/PDL-Stats-${pkgver}.tar.gz")
md5sums=('79556212839f3a1c7b20efd2502dfba3')
sha512sums=('228a678d2c244cddd1a30526f592b9fcd6373c00796942886611884a2b0bb473cfbec95238d75563438d9a1143280185c45e5b8332d983f192bcf13a0c180d4a')
_distdir="PDL-Stats-${pkgver}"

build() {
  ( export PERL_MM_USE_DEFAULT=1 PERL5LIB=""                 \
      PERL_AUTOINSTALL=--skipdeps                            \
      PERL_MM_OPT="INSTALLDIRS=vendor DESTDIR='$pkgdir'"     \
      PERL_MB_OPT="--installdirs vendor --destdir '$pkgdir'" \
      MODULEBUILDRC=/dev/null

    cd "$srcdir/$_distdir"
    /usr/bin/perl Makefile.PL
    make
  )
}

check() {
  cd "$srcdir/$_distdir"
  ( export PERL_MM_USE_DEFAULT=1 PERL5LIB=""
    make test
  )
}

package() {
  cd "$srcdir/$_distdir"
  make install

  find "$pkgdir" -name .packlist -o -name perllocal.pod -delete
}

# Local Variables:
# mode: shell-script
# sh-basic-offset: 2
# End:
# vim:set ts=2 sw=2 et:
