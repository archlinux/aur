# Maintainer: Michał Wojdyła < micwoj9292 at gmail dot com >
# Contributor: John D Jones III <jnbek1972 -_AT_- g m a i l -_Dot_- com>

pkgname='perl-http-body'
pkgver='1.23'
pkgrel='1'
pkgdesc="HTTP Body Parser"
arch=('any')
license=('Artistic-1.0-Perl' 'GPL-1.0-or-later')
options=('!emptydirs')
depends=('perl-http-message')
makedepends=()
checkdepends=('perl-test-deep')
url='https://metacpan.org/dist/HTTP-Body'
source=("https://cpan.metacpan.org/authors/id/G/GE/GETTY/HTTP-Body-$pkgver.tar.gz")
md5sums=('067c2c71d20ed0b364187cdb75b69d40')
_distdir="HTTP-Body-$pkgver"

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
