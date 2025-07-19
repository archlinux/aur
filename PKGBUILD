# Maintainer: Morgenstern <charles [at] charlesbwise [dot] com>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-data-section'
pkgver='0.200008'
pkgrel='5'
pkgdesc="read multiple hunks of data out of your DATA section"
arch=('any')
license=('Artistic-1.0-Perl'
         'GPL-1.0-or-later')
options=('!emptydirs')
depends=('perl-mro-compat>=0.09' 'perl-sub-exporter>=0.979' 'perl>=5.012')
checkdepends=('perl-test-failwarnings>=0')
url='https://metacpan.org/dist/Data-Section'
source=("https://search.cpan.org/CPAN/authors/id/R/RJ/RJBS/Data-Section-${pkgver}.tar.gz")
sha512sums=('5fc8b25b1af8cdae5dca407bc039578e92bfc0b3bcfa2c01cdddf36ea30840f7eeeb336859a2e50719713c2675f2c1eb74c8832724d99ba4db92c47c65a860e3')
_distdir="Data-Section-${pkgver}"

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
