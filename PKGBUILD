# Maintainer: marmis <tiagodepalves@gmail.com>
# Contributor: "marmis" Tiago de Paula <tiagodepalves@gmail.com>
# Contributor: éclairevoyant

pkgname=perl-test-future-io-impl
pkgver=0.16
pkgrel=1
pkgdesc='Acceptance tests for Future::IO implementations'
arch=('any')
url='https://metacpan.org/dist/Test-Future-IO-Impl'
license=('GPL-1.0-or-later OR Artistic-1.0-Perl')
# See https://metacpan.org/dist/Test-Future-IO-Impl/source/Build.PL
depends=(
  ## requires
  'perl>=5.14'
  # 'Errno'
  # 'IO::Handle'
  'perl-socket'
  'perl-time-hires'
  'perl-test-simple>=1.302200' # "Test2::V0"
)
makedepends=(
  ## configure_requires
  'perl-module-build>=0.4004'
)
options=(!emptydirs purge)
source=("https://cpan.metacpan.org/authors/id/P/PE/PEVANS/Test-Future-IO-Impl-${pkgver}.tar.gz")
b2sums=('abe346a888f6acebd59fc23528e06c422d016172b192b9ba6978b2076bc9a273b42ca4722bc02d1ce8f13597521db9fd3c2643ab162e3785d7229bf654965b7b')

build() {
  cd "${srcdir}/Test-Future-IO-Impl-${pkgver}"

  unset PERL5LIB PERL_MM_OPT PERL_MB_OPT PERL_LOCAL_LIB_ROOT
  export PERL_MM_USE_DEFAULT=1 MODULEBUILDRC=/dev/null
  perl Build.PL --installdirs=vendor --create_packlist=0
  ./Build
}

check() {
  cd "${srcdir}/Test-Future-IO-Impl-${pkgver}"

  unset PERL5LIB PERL_MM_OPT PERL_MB_OPT PERL_LOCAL_LIB_ROOT
  export PERL_MM_USE_DEFAULT=1
  ./Build test
}

package() {
  cd "${srcdir}/Test-Future-IO-Impl-${pkgver}"

  unset PERL5LIB PERL_MM_OPT PERL_MB_OPT PERL_LOCAL_LIB_ROOT
  ./Build install --destdir="${pkgdir}"
}
