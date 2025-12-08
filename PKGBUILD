# Maintainer: marmis <tiagodepalves@gmail.com>
# Contributor: "marmis" Tiago de Paula <tiagodepalves@gmail.com>
# Contributor: éclairevoyant

pkgname=perl-test-future-io-impl
pkgver=0.14
pkgrel=2
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
b2sums=('701235a6ad922f237f6d8c051ac5ff71064617b07dc0488f787894064ff7293222fb79c7452213f7dc8f2340ee6c45e732bef72369a2fe9203c94b153b83396d')

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
