# Contributor: Mark Gallagher <mark@fts.scot>
pkgname=perl-module-build-prereqs-fromcpanfile
pkgver=0.02
pkgrel=1
pkgdesc='construct prereq parameters of Module::Build from cpanfile'
_dist=Module-Build-Prereqs-FromCPANfile
arch=('any')
url="https://metacpan.org/release/$_dist"
license=('GPL' 'PerlArtistic')
depends=('perl' 'perl-module-cpanfile')
makedepends=('perl-module-build')
options=('!emptydirs' 'purge')
source=("https://cpan.metacpan.org/authors/id/T/TO/TOSHIOITO/$_dist-$pkgver.tar.gz")
sha256sums=(94d17867bea8e04bf8a636bcbfb78c5d432cb8fbc0e046b88445c3983e089e29)

build() {
  cd $_dist-$pkgver
  unset PERL5LIB PERL_MM_OPT PERL_MB_OPT PERL_LOCAL_LIB_ROOT
  export PERL_MM_USE_DEFAULT=1 MODULEBUILDRC=/dev/null
  /usr/bin/perl Build.PL
  ./Build
}

check() {
  cd $_dist-$pkgver
  unset PERL5LIB PERL_MM_OPT PERL_MB_OPT PERL_LOCAL_LIB_ROOT
  export PERL_MM_USE_DEFAULT=1
  ./Build test
}

package() {
  cd $_dist-$pkgver
  unset PERL5LIB PERL_MM_OPT PERL_MB_OPT PERL_LOCAL_LIB_ROOT
  ./Build install --installdirs=vendor --destdir="$pkgdir"
}
