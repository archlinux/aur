# Contributor: Daniel Maurice Davis <daniel.maurice.davis@gmail.com>

pkgname='perl-perl-languageserver'
pkgver='0.03'
pkgrel='1'
pkgdesc="Language Server for Perl"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs' purge)
depends=('perl-anyevent>=0' 'perl-anyevent-aio>=0' 'perl-compiler-lexer-git' 'perl-coro>=0' 'perl-data-dump>=0' 'perl-io-aio>=0' 'perl-json>=0' 'perl-moose>=0' 'perl>=5.014')
makedepends=()
url='https://metacpan.org/release/Perl-LanguageServer'
source=('http://search.cpan.org/CPAN/authors/id/G/GR/GRICHTER/Perl-LanguageServer-0.03.tar.gz')
md5sums=('0629b505f336f98a4b3c06c6a61cb9c7')
sha512sums=('26911f02bb76bf221716f5f10c30046fc92c4c3424c08d7753060f7abbcfc2b690e1e181409f24435c35e84859b4d789768c1c31650e02e650f810352d8fe0c4')
_distdir="Perl-LanguageServer-0.03"

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
