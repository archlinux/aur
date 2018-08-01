# Maintainer: Florian Pritz <bluewind@xinu.at>

pkgname=perl-log-any
pkgver=1.049
pkgrel=4
pkgdesc='Bringing loggers and listeners together'
arch=(any)
license=(PerlArtistic GPL)
options=(!emptydirs)
depends=(perl)
url=https://metacpan.org/release/Log-Any
source=("http://search.cpan.org/CPAN/authors/id/P/PR/PREACTION/Log-Any-$pkgver.tar.gz")
md5sums=(65ea31597f5bcef73d28e18502e42643)
sha512sums=(9a6363c7fa8c187deb1c9008411150d3c6a723e17c51cfd957127b2f33246ce680bcea47eae15e856358e643ea8bd8c923a540503b733c421d94f9fdca340f7b)
_ddir="Log-Any-$pkgver"

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
