# Maintainer: Florian Pritz <bluewind@xinu.at>

pkgname=perl-app-borgrestore
pkgver=2.0.1
pkgrel=1
pkgdesc='Restore paths from borg backups'
arch=(any)
license=(PerlArtistic GPL)
options=(!emptydirs)
depends=('perl>=5.10.0' perl-dbd-sqlite perl-dbi perl-function-parameters
         perl-ipc-run perl-log-any perl-log-any-adapter-log4perl
         perl-log-log4perl)
makedepends=(perl-devel-checkbin 'perl-module-build-tiny>=0.035')
checkdepends=(perl-test-differences perl-test-exception perl-test-mockobject)
url=https://metacpan.org/release/App-BorgRestore
source=("http://search.cpan.org/CPAN/authors/id/B/BL/BLUEWIND/App-BorgRestore-$pkgver.tar.gz")
md5sums=(42ba9721a10324e4a663bbc021047ede)
sha512sums=(cdabf9d09f067e214763af59156fa7c0f1e2b4326fde32da4391c5d55cfdb8ab1873594927120a64b2a33e586bc05cf9fbc1b5716ffa3e0a77c6b1bfe6457ff0)
_ddir="App-BorgRestore-$pkgver"

build()
(
  cd "$srcdir/$_ddir"
  export PERL_MM_USE_DEFAULT=1 MODULEBUILDRC=/dev/null
  unset PERL5LIB PERL_MB_OPT
  /usr/bin/perl Build.PL
  ./Build
)

check()
(
  cd "$srcdir/$_ddir"
  export PERL_MM_USE_DEFAULT=1 MODULEBUILDRC=/dev/null
  unset PERL5LIB PERL_MB_OPT
  ./Build test
)

package()
(
  cd "$srcdir/$_ddir"
  export PERL_MM_USE_DEFAULT=1 MODULEBUILDRC=/dev/null
  unset PERL5LIB PERL_MB_OPT
  ./Build install installdirs=vendor destdir="$pkgdir"
  find "$pkgdir" -name .packlist -o -name perllocal.pod -delete
)

# Local Variables:
# mode: shell-script
# sh-basic-offset: 2
# End:
# vim:set ts=2 sw=2 et:
