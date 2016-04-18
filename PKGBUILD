# Contributor: John D Jones III AKA jnbek <jnbek1972 -_AT_- g m a i l -_Dot_- com>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-html-stripscripts'
pkgver='1.05'
pkgrel='1'
pkgdesc="Strip scripting constructs out of HTML"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl')
makedepends=()
url='https://metacpan.org/release/HTML-StripScripts'
source=(
  'http://search.cpan.org/CPAN/authors/id/D/DR/DRTECH/HTML-StripScripts-1.05.tar.gz'
  'HTML-StripScripts-1.05-Fix-typo-in-regex.patch')
md5sums=(
  'e8c51fbfda69efaf94c2937084d2458f'
  '9d9adc755b19118d4c3b187ee396c33c')
_distdir="HTML-StripScripts-1.05"

build() {
  ( export PERL_MM_USE_DEFAULT=1 PERL5LIB=""                 \
      PERL_AUTOINSTALL=--skipdeps                            \
      PERL_MM_OPT="INSTALLDIRS=vendor DESTDIR='$pkgdir'"     \
      PERL_MB_OPT="--installdirs vendor --destdir '$pkgdir'" \
      MODULEBUILDRC=/dev/null

    cd "$srcdir/$_distdir"
    patch -Np1 -i ../HTML-StripScripts-1.05-Fix-typo-in-regex.patch
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
