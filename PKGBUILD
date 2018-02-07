# Maintainer: Florian Pritz <bluewind@xinu.at>

pkgname=perl-app-borgrestore
pkgver=2.3.0
pkgrel=1
pkgdesc='Restore paths from borg backups'
arch=(any)
license=(PerlArtistic GPL)
options=(!emptydirs)
depends=('perl>=5.14.0' perl-dbd-sqlite perl-dbi perl-file-pushd
         perl-function-parameters perl-ipc-run perl-json perl-log-any
         perl-log-any-adapter-log4perl perl-log-log4perl
         perl-number-bytes-human perl-path-tiny perl-timedate
         perl-version-compare borg)
makedepends=(perl-devel-checkbin 'perl-module-build-tiny>=0.035')
checkdepends=(perl-test-differences perl-test-exception perl-test-mockobject
              perl-test-pod perl-test-pod-coverage)
url=https://metacpan.org/release/App-BorgRestore
source=("http://search.cpan.org/CPAN/authors/id/B/BL/BLUEWIND/App-BorgRestore-$pkgver.tar.gz")
md5sums=(cabadb286df60aee61ea0b96c40a4108)
sha512sums=(f59476226df468ac9a39c584be7075c7de0c4fe46a48ca6b51f027b92ccf076381f230e4d70cdb8df0f4d2073ad0bc968c5c4b4fb454f211cedd829f4591fe3e)
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
  find "$pkgdir" -name .packlist -o -name perllocal.pod -delete
)

# Local Variables:
# mode: shell-script
# sh-basic-offset: 2
# End:
# vim:set ts=2 sw=2 et:
