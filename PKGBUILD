# Contributor: John D Jones III <jnbek1972 -_AT_- g m a i l -_Dot_- com>

pkgname='perl-text-format'
pkgver='0.62'
pkgrel='1'
pkgdesc="Various subroutines to format text."
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl')
makedepends=('perl-module-build')
url='https://metacpan.org/release/Text-Format'
source=('https://search.cpan.org/CPAN/authors/id/S/SH/SHLOMIF/Text-Format-0.62.tar.gz')
md5sums=('b65464a656886bfc2cc2ebedd68cb970')
_distdir="Text-Format-0.62"

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
