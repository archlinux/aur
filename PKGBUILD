# Maintainer : int <int [ate] arcor [dot] de>
# Generator  : CPANPLUS::Dist::Arch 1.32

# In HTTP::OAI version 4.03-4.06 there is a test that fails,
# so I downgraded to the older version.
# Maybe it is better to ignore the failing test.
# This issue should be investigated further.
# The trigger that error just install HTTP::OAI via CPAN.
#
# cpan2aur needs perl-cpanplus-dist-build to generate this PKGBUILD
# see https://bugs.archlinux.org/task/46900.
#
pkgname='perl-http-oai'
pkgver='3.28'
pkgrel='1'
pkgdesc="API for the OAI-PMH"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-cgi' 'perl-http-message' 'perl-uri' 'perl-xml-libxml>=1.6' 'perl-xml-sax' 'perl-xml-sax-base>=1.04' 'perl-libwww')
makedepends=()
url='https://metacpan.org/release/HTTP-OAI'
source=('http://search.cpan.org/CPAN/authors/id/T/TI/TIMBRODY/HTTP-OAI-3.28.tar.gz')
md5sums=('09fb4ba4b9da2cda3910fa4b31273568')
sha512sums=('9b848ec6213189532e7bc104ec928f2b66c2a4945a3a7a0f37bd5cbb0171e2046e038634079d9c47a005d8cd7531bc636c0d74a20fd697bf312b8f3b8a5e007c')
_distdir="HTTP-OAI-3.28"

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
