# Contributor: ordoban <dirk.langer@vvovgonik.de>

pkgname='perl-http-cookiemonster'
pkgver='0.11'
pkgrel='1'
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
source=("https://cpan.metacpan.org/authors/id/O/OA/OALDERS/HTTP-CookieMonster-$pkgver.tar.gz")
md5sums=('f327b6f0e243d8e8181a5c30b6fd428c')
sha512sums=('d6cbd96e9847f2bb3fe7351e5673b2d5bc24814fd1c2e46ddafd0f7e63082bdf08bf90ca243b32b92b22643da5e9f4ef1c1f51ebe6638f0b581b3bbade212fb7')
_distdir="HTTP-CookieMonster-$pkgver"

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
