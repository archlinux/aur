# Maintainer: Michał Wojdyła < micwoj9292 at gmail dot com >
# Contributor: John D Jones III <j[nospace]n[nospace]b[nospace]e[nospace]k[nospace]1972 -_AT_- the domain name google offers a mail service at ending in dot com>

pkgname='perl-mixin-extrafields-param'
pkgver='0.022'
pkgrel='1'
pkgdesc="make your class provide a familiar \"param\" method"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-mixin-extrafields')
url='https://search.cpan.org/dist/Mixin-ExtraFields-Param'
_distdir="Mixin-ExtraFields-Param-$pkgver"
source=(https://search.cpan.org/CPAN/authors/id/R/RJ/RJBS/$_distdir.tar.gz)
md5sums=('82acf03e07698245c2eb948514fcb4e2')

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
