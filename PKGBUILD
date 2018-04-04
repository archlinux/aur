# Maintainer : int <int [ate] arcor [dot] de>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-test-strict'
pkgver='0.45'
pkgrel='1'
pkgdesc="Perl/CPAN Module Test::Strict: Check syntax, presence of use strict; and test coverage"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-io-stringy' 'perl>=5.006')
makedepends=()
url='https://metacpan.org/release/Test-Strict'
source=("http://search.cpan.org/CPAN/authors/id/M/MA/MANWAR/Test-Strict-$pkgver.tar.gz")
md5sums=('9f25177c42e6d60bfa742543c7ffc630')
sha512sums=('62645350b29edd962d6ba2d3734fec7626c9cdb1610f3c464c3bd9918cfd3b2036e6fef8773c9a528109864fe8741081a62e1c1744e16f9fbd5c8a75035ab4d0')
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
