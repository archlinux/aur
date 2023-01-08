# Maintainer: Florian Pritz <bluewind@xinu.at>

pkgname=perl-data-section
pkgver=0.200008
pkgrel=1
pkgdesc='read multiple hunks of data out of your DATA section'
arch=(any)
license=(PerlArtistic GPL)
options=(!emptydirs)
depends=('perl>=5.12' 'perl-mro-compat>=0.09' 'perl-sub-exporter>=0.979')
makedepends=('perl-extutils-makemaker>=6.78')
checkdepends=(perl-test-failwarnings)
url=https://metacpan.org/release/Data-Section
source=("https://cpan.metacpan.org/authors/id/R/RJ/RJBS/Data-Section-$pkgver.tar.gz")
md5sums=(3e23aec25adece87533f7254f1b9c4a3)
sha512sums=(5fc8b25b1af8cdae5dca407bc039578e92bfc0b3bcfa2c01cdddf36ea30840f7eeeb336859a2e50719713c2675f2c1eb74c8832724d99ba4db92c47c65a860e3)
_ddir="Data-Section-$pkgver"

build()
(
  cd "$srcdir/$_ddir"
  export PERL_MM_USE_DEFAULT=1 PERL_AUTOINSTALL=--skipdeps
  unset PERL5LIB PERL_MM_OPT
  /usr/bin/perl Makefile.PL
  make
)

check()
(
  cd "$srcdir/$_ddir"
  export PERL_MM_USE_DEFAULT=1
  unset PERL5LIB
  make test
)

package()
(
  cd "$srcdir/$_ddir"
  make install INSTALLDIRS=vendor DESTDIR="$pkgdir"
)

# Local Variables:
# mode: shell-script
# sh-basic-offset: 2
# End:
# vim:set ts=2 sw=2 et:
