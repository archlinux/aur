# Maintainer: marmis <tiagodepalves@gmail.com>
# Contributor: "marmis" Tiago de Paula <tiagodepalves@gmail.com>
# Contributor: éclairevoyant

pkgname=perl-test-future-io-impl
pkgver=0.19
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
options=(!emptydirs)
source=("https://cpan.metacpan.org/authors/id/P/PE/PEVANS/Test-Future-IO-Impl-${pkgver}.tar.gz")
b2sums=('b015cfa3ca589ae6be1205f7efd2a14d049c4880c62afed764a89f12b6519031404199973b0102d079c071709fba193fdb74f4d2d8c02c5d2c560961e9d158f3')

build() {
  cd "${srcdir}/Test-Future-IO-Impl-${pkgver}"

  unset PERL_MB_OPT PERL5LIB PERL_LOCAL_LIB_ROOT
  export PERL_MM_USE_DEFAULT=1 MODULEBUILDRC=/dev/null
  /usr/bin/perl Build.PL --create_packlist=0
  ./Build
}

check() {
  cd "${srcdir}/Test-Future-IO-Impl-${pkgver}"

  unset PERL5LIB PERL_LOCAL_LIB_ROOT
  ./Build test
}

package() {
  cd "${srcdir}/Test-Future-IO-Impl-${pkgver}"

  unset PERL5LIB PERL_LOCAL_LIB_ROOT
  ./Build install --installdirs=vendor --destdir="${pkgdir}"
}
