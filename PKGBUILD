# Maintainer: Florian Pritz <bluewind@xinu.at>

pkgname=perl-log-any-adapter-tap
pkgver=0.003003
pkgrel=1
pkgdesc='Logger suitable for use with TAP test files'
arch=(any)
license=(PerlArtistic GPL)
options=(!emptydirs)
depends=('perl>=5.6.0' perl-log-any perl-try-tiny)
url=https://metacpan.org/release/Log-Any-Adapter-TAP
source=("http://search.cpan.org/CPAN/authors/id/N/NE/NERDVANA/Log-Any-Adapter-TAP-$pkgver.tar.gz")
md5sums=(c5fe31d8990f8ce06cc6a8fdc3feec58)
sha512sums=(fbb8c5893d184c066fe471a207ecca98f2cacfbd98401f35d156cbb8bde567b313d846b75f721643fc470c1a19c162d3d791585f87d47a71e4fd7372252e65a5)
_ddir="Log-Any-Adapter-TAP-$pkgver"

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
