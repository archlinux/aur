# Contributor: John D Jones III AKA jnbek <jnbek1972 -_AT_- g m a i l -_Dot_- com>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-lexical-var'
pkgver='0.009'
pkgrel='1'
pkgdesc="static variables without namespace pollution"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-lexical-sealrequirehints>=0.006' 'perl-module-build' 'perl>=5.006')
makedepends=()
url='https://metacpan.org/release/Lexical-Var'
source=(
  'http://search.cpan.org/CPAN/authors/id/Z/ZE/ZEFRAM/Lexical-Var-0.009.tar.gz'
  '5-2x.patch'
)
md5sums=(
  'e0b2aa20146f26494f2e10dab7f43341'
  '4b5e9fa174115be7b28eb5ae44c8ff21'
)
_distdir="Lexical-Var-0.009"

build() {
  ( export PERL_MM_USE_DEFAULT=1 PERL5LIB=""                 \
      PERL_AUTOINSTALL=--skipdeps                            \
      PERL_MM_OPT="INSTALLDIRS=vendor DESTDIR='$pkgdir'"     \
      PERL_MB_OPT="--installdirs vendor --destdir '$pkgdir'" \
      MODULEBUILDRC=/dev/null

    cd "$srcdir/$_distdir"
    patch -Np1 -i ../5-2x.patch
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
