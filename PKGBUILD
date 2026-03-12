# Maintainer: marmis <tiagodepalves@gmail.com>
# Contributor: "marmis" Tiago de Paula <tiagodepalves@gmail.com>
# Contributor: éclairevoyant

pkgname=perl-test-future-io-impl
pkgver=0.21
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
b2sums=('736cc8944a90582dac80f1ba7b2edfddc4867b959d9d70835dfb2ae7a6309161bccf97d9970069e5072ef266507e77dd6efcb8aef7936791f76ed3b06ae7e5d5')

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
