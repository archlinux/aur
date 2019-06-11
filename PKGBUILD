# Maintainer: Dirk Langer <dirk.langer@vvovgonik.de>
# Contributor: John D Jones III AKA jnbek <jnbek1972 -_AT_- g m a i l -_Dot_- com>

pkgname='perl-moose'
pkgver='2.2011'
pkgrel='6'
pkgdesc="A postmodern object system for Perl 5"
arch=('x86_64')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-cpan-meta-check>=0.011' 'perl-class-load>=0.09' 'perl-class-load-xs>=0.01' 'perl-data-optlist>=0.107' 'perl-devel-globaldestruction' 'perl-devel-overloadinfo>=0.005' 'perl-devel-stacktrace>=2.03' 'perl-dist-checkconflicts>=0.02' 'perl-eval-closure>=0.04' 'perl-mro-compat>=0.05' 'perl-module-runtime>=0.014' 'perl-module-runtime-conflicts>=0.002' 'perl-package-deprecationmanager>=0.11' 'perl-package-stash>=0.32' 'perl-package-stash-xs>=0.24' 'perl-params-util>=1.00' 'perl-scalar-list-utils' 'perl-sub-exporter>=0.980' 'perl-sub-identify' 'perl-sub-name>=0.20' 'perl-try-tiny>=0.17')
makedepends=()
checkdepends=('perl-test-cleannamespaces>=0.13' 'perl-test-fatal>=0.001' 'perl-test-requires>=0.05')
url='https://metacpan.org/release/Moose'
source=("http://search.cpan.org/CPAN/authors/id/E/ET/ETHER/Moose-$pkgver.tar.gz")
md5sums=('2816e852847a82a5c90cf70a8ab28cfc')
sha512sums=('f94ed23c45a860b9afa8defe7f5067a65fdd9d457d94a85e4ea192640d09ad73bc336a2e54c4c663643ec0efa32872f4b2aa69083e99093e420cecf5430f34a3')
_distdir="Moose-$pkgver"

build() {
  export PERL_MM_USE_DEFAULT=1 PERL5LIB=""                 \
      PERL_AUTOINSTALL=--skipdeps                            \
      PERL_MM_OPT="INSTALLDIRS=vendor DESTDIR='$pkgdir'"     \
      PERL_MB_OPT="--installdirs vendor --destdir '$pkgdir'" \
      MODULEBUILDRC=/dev/null

  cd "$srcdir/$_distdir"
  /usr/bin/perl Makefile.PL
  make
}

check() {
  cd "$srcdir/$_distdir"
  make test
}

package() {
  cd "$srcdir/$_distdir"
  make install

  find "$pkgdir" \( -name .packlist -o -name perllocal.pod \) -delete
}

# Local Variables:
# mode: shell-script
# sh-basic-offset: 2
# End:
# vim:set ts=2 sw=2 et:
