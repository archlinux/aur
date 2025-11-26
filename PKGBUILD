# Maintainer : int <int [ate] arcor [dot] de>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-test-strict'
pkgver='0.54'
pkgrel='1'
pkgdesc="Perl/CPAN Module Test::Strict: Check syntax, presence of use strict; and test coverage"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-io-stringy' 'perl>=5.006')
makedepends=()
url='https://metacpan.org/release/Test-Strict'
source=("http://search.cpan.org/CPAN/authors/id/M/MA/MANWAR/Test-Strict-$pkgver.tar.gz")
md5sums=('b0821dc4af3c50f152f4a58842d3a24e')
sha512sums=('4e870dcc1c7d296ec4a49aa204c2dedd2eb77cdd02777c7565e5c1aefc1200ebac2a9e84e889f2cb36a80c34a0b51c70c5fb5772b6827272cf15c46dbc573fb5')
_distdir="Test-Strict-$pkgver"

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

  find "$pkgdir" "(" -name .packlist -o -name perllocal.pod ")" -delete
}

# Local Variables:
# mode: shell-script
# sh-basic-offset: 2
# End:
# vim:set ts=2 sw=2 et:
