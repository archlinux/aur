# Maintainer: Florian Pritz <bluewind@xinu.at>

pkgname=perl-data-section
pkgver=0.200007
pkgrel=2
pkgdesc='read multiple hunks of data out of your DATA section'
arch=(any)
license=(PerlArtistic GPL)
options=(!emptydirs)
depends=('perl-mro-compat>=0.09' 'perl-sub-exporter>=0.979')
checkdepends=(perl-test-failwarnings)
url=https://metacpan.org/release/Data-Section
source=("http://search.cpan.org/CPAN/authors/id/R/RJ/RJBS/Data-Section-$pkgver.tar.gz")
md5sums=(1d36b49d809a2b7939c7817ba4bc38cb)
sha512sums=(0c23141ccc2041e8c1c222c95d6eab4b56e2d77a94c68507f67acbb62fa5132e9229e9680c9fff6ebbc6a47a42cf1943d6e5b50a5f0168c66193fb52aaa241f0)
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
  find "$pkgdir" -name .packlist -o -name perllocal.pod -delete
)

# Local Variables:
# mode: shell-script
# sh-basic-offset: 2
# End:
# vim:set ts=2 sw=2 et:
