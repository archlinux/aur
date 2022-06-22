# Contributor: John D Jones III <j[nospace]n[nospace]b[nospace]e[nospace]k[nospace]1972 -_AT_- the domain name google offers a mail service at ending in dot com>

pkgname='perl-plack-middleware-removeredundantbody'
pkgver='0.09'
pkgrel='1'
pkgdesc="Plack::Middleware which sets removes body for HTTP response if it's not required"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-plack')
#depends=('perl-carp-always' 'perl-http-message')
url='http://search.cpan.org/dist/Plack-Middleware-RemoveRedundantBody'
source=('https://cpan.metacpan.org/authors/id/S/SW/SWEETKID/Plack-Middleware-RemoveRedundantBody-0.09.tar.gz')
sha256sums=('80d45f93d6b7290b0bd8b3cedd84a37fc501456cc3dec02ec7aad81c0018087e')
_distdir="Plack-Middleware-RemoveRedundantBody-0.09"

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