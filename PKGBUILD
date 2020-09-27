# Maintainer: Florian Pritz <bluewind@xinu.at>

pkgname=perl-app-borgrestore
pkgver=3.4.3
pkgrel=1
pkgdesc='Restore paths from borg backups'
arch=(any)
license=(PerlArtistic GPL)
options=(!emptydirs)
depends=('perl>=5.14.0' perl-dbd-sqlite perl-dbi perl-file-pushd
         perl-function-parameters perl-ipc-run perl-json perl-log-any
         perl-log-any-adapter-log4perl perl-log-log4perl
         perl-number-bytes-human perl-path-tiny perl-scalar-list-utils
         perl-strictures perl-timedate perl-version-compare borg)
makedepends=(perl-devel-checkbin 'perl-module-build-tiny>=0.035')
checkdepends=(perl-log-any-adapter-tap perl-software-license
              perl-test-differences perl-test-exception perl-test-mockobject
              perl-test-pod perl-test-pod-coverage)
url=https://metacpan.org/release/App-BorgRestore
source=("https://cpan.metacpan.org/authors/id/B/BL/BLUEWIND/App-BorgRestore-$pkgver.tar.gz")
md5sums=('e53a75e824875e6797a834efe6d57c0d')
sha512sums=('e323ed790a0d302580dbbf2df751e8471662ae2749526b107cbd3d19dc75aa1f8e7161a85c4787f36fe8632d1befc325a463fedcb2c8a4f5e5bd9f29012d5d3a')
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
