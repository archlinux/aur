# Maintainer: Florian Pritz <bluewind@xinu.at>

pkgname=perl-app-borgrestore
pkgver=3.4.5
pkgrel=3
pkgdesc='Restore paths from borg backups'
arch=(any)
license=(PerlArtistic GPL)
options=(!emptydirs)
depends=('perl>=5.14.0' perl-carp-assert 'perl-dbd-sqlite>=1.60' perl-dbi
         perl-file-pushd perl-function-parameters perl-ipc-run perl-json
         perl-log-any perl-log-any-adapter-log4perl perl-log-log4perl
         perl-number-bytes-human perl-path-tiny perl-scalar-list-utils
         perl-strictures perl-timedate perl-version-compare borg)
makedepends=(perl-devel-checkbin 'perl-module-build-tiny>=0.035')
checkdepends=(perl-log-any-adapter-tap perl-software-license
              perl-test-differences perl-test-exception perl-test-mockobject
              perl-test-pod perl-test-pod-coverage)
url=https://metacpan.org/release/App-BorgRestore
source=("https://cpan.metacpan.org/authors/id/B/BL/BLUEWIND/App-BorgRestore-$pkgver.tar.gz")
md5sums=('17dab0d56ff991e574c1e156b378d9a3')
sha512sums=('75ece679abe1d8644b731a12725bf59fc6ace9d334efad2a7744413ff5c929c7951de86fb388f572b40804ede24e90d1b71dd5e9247a068dee19b7615b806062')
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
  ./Build install --installdirs=vendor --destdir="$pkgdir"
)

# Local Variables:
# mode: shell-script
# sh-basic-offset: 2
# End:
# vim:set ts=2 sw=2 et:
