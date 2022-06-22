# Maintainer: Michał Wojdyła < micwoj9292 at gmail dot com >
# Contributor: John D Jones III <j[nospace]n[nospace]b[nospace]e[nospace]k[nospace]1972 -_AT_- the domain name google offers a mail service at ending in dot com>

pkgname='perl-cgi-simple'
epoch='1'
pkgver='1.280'
pkgrel='1'
pkgdesc="A Simple totally OO CGI interface that is CGI.pm compliant"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl')
checkdepends=('perl-test-nowarnings' 'perl-test-exception')
url='https://metacpan.org/dist/CGI-Simple'
source=(https://cpan.metacpan.org/authors/id/M/MA/MANWAR/CGI-Simple-$pkgver.tar.gz)
sha256sums=('18e01e9ffb814e5e4eea77ac8489b2069fe836518550f37f6c2213eb559c6abf')
_distdir="CGI-Simple-$pkgver"

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