# Maintainer: Florian Pritz <bluewind@xinu.at>

pkgname=perl-devel-checkbin
pkgver=0.04
pkgrel=4
pkgdesc='check that a command is available'
arch=(any)
license=(PerlArtistic GPL)
options=(!emptydirs)
depends=('perl>=5.8.1')
makedepends=('perl-extutils-makemaker>=6.64')
url=https://metacpan.org/release/Devel-CheckBin
source=("http://search.cpan.org/CPAN/authors/id/T/TO/TOKUHIROM/Devel-CheckBin-$pkgver.tar.gz")
md5sums=(042b68e48d9b53de7d3ef4c726d57cb2)
sha512sums=(7b28092fa2e6309ddc09976dcfadabbad9be678352c5b97a7938bf7e73944454e5c3c198aaf1a39939f24544e436ec4323925e77fa91e8d92e3986702c840f44)
_ddir="Devel-CheckBin-$pkgver"

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
