# Maintainer: Florian Pritz <bluewind@xinu.at>

pkgname=perl-software-license
pkgver=0.103013
pkgrel=2
pkgdesc='packages that provide templated software licenses'
arch=(any)
license=(PerlArtistic GPL)
options=(!emptydirs)
depends=('perl>=5.6' perl-data-section perl-text-template)
checkdepends=(perl-try-tiny)
url=https://metacpan.org/release/Software-License
source=("http://search.cpan.org/CPAN/authors/id/L/LE/LEONT/Software-License-$pkgver.tar.gz")
md5sums=(ec6e88f6ba4691f834807d4f6f606bad)
sha512sums=(69af2e6f759cb9c449ee2045e26d4cc6e344eec07f1ecae6718a5bcc0a11e594009338f509f321100b214af1a445169cf06fd32e11a477f137e57de33f377b25)
_ddir="Software-License-$pkgver"

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
