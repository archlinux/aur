# Contributor: ordoban <dirk.langer@vvovgonik.de>

pkgname='perl-http-cookiemonster'
pkgver='0.09'
pkgrel='2'
pkgdesc="Easy read/write access to your jar of HTTP::Cookies"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=(
  'perl'
  'perl-http-cookies'
)
makedepends=()
checkdepends=(
  'perl-data-serializer'
  'perl-safe-isa'
)
url='https://metacpan.org/pod/HTTP::CookieMonster'
source=('https://cpan.metacpan.org/authors/id/O/OA/OALDERS/HTTP-CookieMonster-0.09.tar.gz')
md5sums=('0fb7bc98f77a9847fcdbfb692fdaea6a')
sha512sums=('aa55750c502ab1a30615987adca7fa65c3288ee5d19cab82363342627def54b1def405aab8b04ffde998744f7b71798802351d2e4fcc51c844ee95df763e9e4f')
_distdir="HTTP-CookieMonster-0.09"

build() {
   export PERL_MM_USE_DEFAULT=1 PERL5LIB=""                 \
      PERL_AUTOINSTALL=--skipdeps                            \
      PERL_MM_OPT="INSTALLDIRS=vendor DESTDIR='$pkgdir'"     \
      PERL_MB_OPT="--installdirs vendor --destdir '$pkgdir'" \
      MODULEBUILDRC=/dev/null

    cd "$srcdir/$_distdir"
    /usr/bin/perl Makefile.PL
    make
}

check() {
  cd "$srcdir/$_distdir"
  export PERL_MM_USE_DEFAULT=1 PERL5LIB=""
  make test
}

package() {
  cd "$srcdir/$_distdir"
  make install
  find "$pkgdir" \( -name .packlist -o -name perllocal.pod \) -delete 
}

# Local Variables:
# mode: shell-script
# sh-basic-offset: 2
# End:
# vim:set ts=2 sw=2 et:
