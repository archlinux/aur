# Maintainer: Florian Pritz <bluewind@xinu.at>

pkgname=perl-app-borgrestore
pkgver=2.1.1
pkgrel=1
pkgdesc='Restore paths from borg backups'
arch=(any)
license=(PerlArtistic GPL)
options=(!emptydirs)
depends=('perl>=5.14.0' perl-dbd-sqlite perl-dbi perl-file-pushd
         perl-function-parameters perl-ipc-run perl-log-any
         perl-log-any-adapter-log4perl perl-log-log4perl borg)
makedepends=(perl-devel-checkbin 'perl-module-build-tiny>=0.035')
checkdepends=(perl-test-differences perl-test-exception perl-test-mockobject
              perl-test-pod perl-test-pod-coverage)
url=https://metacpan.org/release/App-BorgRestore
source=("http://search.cpan.org/CPAN/authors/id/B/BL/BLUEWIND/App-BorgRestore-$pkgver.tar.gz")
md5sums=(944406f1f360e17dd3eea9b27154b105)
sha512sums=(a093bd6e76d2c2ba2b6f32d5a305425bdbf7ca6535e7751b6d6615ed47af6599588bcc3f6c161f7eaec4889950e66825beb7b815e595f16f28632541ff46e88a)
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
