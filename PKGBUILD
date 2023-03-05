# Contributor: Michał Wojdyła < micwoj9292 at gmail dot com >

pkgname='perl-datetime-hires'
pkgver='0.04'
pkgrel='1'
pkgdesc="Create DateTime objects with sub-second current time resolution"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-datetime')
url='https://metacpan.org/dist/DateTime-HiRes'
source=('https://cpan.metacpan.org/authors/id/D/DR/DROLSKY/DateTime-HiRes-0.04.tar.gz')
md5sums=('6e7be00854ce84cac644cf04c66a6f33')
_distdir="DateTime-HiRes-0.04"

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
