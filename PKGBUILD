# Maintainer: Michał Wojdyła < micwoj9292 at gmail dot com >
# Contributor: John D Jones III <j[nospace]n[nospace]b[nospace]e[nospace]k[nospace]1972 -_AT_- the domain name google offers a mail service at ending in dot com>

pkgname='perl-cgi-simple'
epoch='1'
pkgver='1.281'
pkgrel='2'
pkgdesc="A Simple totally OO CGI interface that is CGI.pm compliant"
arch=('any')
license=('Artistic-1.0-Perl' 'GPL-1.0-or-later')
options=('!emptydirs')
depends=('perl')
checkdepends=('perl-test-nowarnings' 'perl-test-exception' 'perl-http-message' 'perl-test-version')
url='https://metacpan.org/dist/CGI-Simple'
_distdir="CGI-Simple-$pkgver"
source=(https://cpan.metacpan.org/authors/id/M/MA/MANWAR/$_distdir.tar.gz)
sha256sums=('4d58103fdfa5c8e1ed076b15d5cafb7001b2886cb3396f00564a881eb324e5a7')

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
