# Contributor: Michal Wojdyla < micwoj9292 at gmail dot com >
# Contributor: John D Jones III <j[nospace]n[nospace]b[nospace]e[nospace]k[nospace]1972 -_AT_- the domain name google offers a mail service at ending in dot com>

pkgname='perl-cgi-simple'
epoch='1'
pkgver='1.25'
pkgrel='1'
pkgdesc="A Simple totally OO CGI interface that is CGI.pm compliant"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-io-stringy')
checkdepends=('perl-test-version')
url='http://search.cpan.org/dist/CGI-Simple'
source=('https://cpan.metacpan.org/authors/id/M/MA/MANWAR/CGI-Simple-1.25.tar.gz')
sha512sums=('ace262b4ccafe2ee01582aacf52b31aa1202dc5408bb33071330bc7c53f2cfbb39f9e8844c4511c86125dc05f7161b7592a4038c353dddd1bfd52c03dbcfa9dd')
_distdir="CGI-Simple-1.25"

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