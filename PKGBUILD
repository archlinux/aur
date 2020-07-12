# Maintainer : int <int [ate] arcor [dot] de>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-test-strict'
pkgver='0.52'
pkgrel='1'
pkgdesc="Perl/CPAN Module Test::Strict: Check syntax, presence of use strict; and test coverage"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-io-stringy' 'perl>=5.006')
makedepends=()
url='https://metacpan.org/release/Test-Strict'
source=("http://search.cpan.org/CPAN/authors/id/M/MA/MANWAR/Test-Strict-$pkgver.tar.gz")
md5sums=('d0bacf3430620aa6a673309d49752dd1')
sha512sums=('2d2e27f8fa5156bae4b54c2a9da5f5bd37c820ca9f9594f51c0915695f74f16880445d8a47de5a86d0277482b8234d4ab8e1c8a7ba00871c950268be40f543b5')
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
