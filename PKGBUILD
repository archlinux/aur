# Maintainer: marmis <tiagodepalves@gmail.com>
# Contributor: "marmis" Tiago de Paula <tiagodepalves@gmail.com>
# Contributor: éclairevoyant

pkgname=perl-test-future-io-impl
pkgver=0.17
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
b2sums=('d328423084a4de4f968d6a9665d55b720d4b22e17827c7f9745423de879ecb3b05dbe0ead2e1b6f165f9d26f844b23708e69498125e6372723d2fa2a4eae05d2')

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
