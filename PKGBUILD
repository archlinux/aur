# Maintainer: éclairevoyant
# Contributor: Jakob Nixdorf <flocke at shadowice dot org>

pkgname=perl-struct-dumb
pkgver=0.14
pkgrel=2
pkgdesc='Make simple lightweight record-like structures'
arch=('any')
url='https://metacpan.org/dist/Struct-Dumb'
license=('GPL-1.0-or-later OR Artistic-1.0-Perl')
# See https://metacpan.org/dist/Struct-Dumb/source/Build.PL
checkdepends=(
  ## tests_requires
  'perl-test-simple>=1.302200' # 'Test2::V0'
)
makedepends=(
  ## configure_requires
  'perl-module-build>=0.4004'

  ## t/10data-dump.t
  'perl-data-dump'
)
optdepends=(
  ## lib/Struct/Dumb.pm
  'perl-data-dump: print in serialised format'
)
options=(!emptydirs purge)
source=("https://cpan.metacpan.org/authors/id/P/PE/PEVANS/Struct-Dumb-${pkgver}.tar.gz")
b2sums=('fce3b9a9a78a27503f9cc809a312a3beba40f0e274a041b2e7f6f7f85496de9c23b4b74b2ba5156d3650040d5d9d05fd9dcb7297d430a872c04c5c3cb70a3d32')


build() {
  cd "${srcdir}/Struct-Dumb-${pkgver}"

  unset PERL5LIB PERL_MM_OPT PERL_MB_OPT PERL_LOCAL_LIB_ROOT
  export PERL_MM_USE_DEFAULT=1 MODULEBUILDRC=/dev/null
  perl Build.PL --installdirs=vendor --create_packlist=0
  ./Build
}

check() {
  cd "${srcdir}/Struct-Dumb-${pkgver}"

  unset PERL5LIB PERL_MM_OPT PERL_MB_OPT PERL_LOCAL_LIB_ROOT
  export PERL_MM_USE_DEFAULT=1
  ./Build test
}

package() {
  cd "${srcdir}/Struct-Dumb-${pkgver}"

  unset PERL5LIB PERL_MM_OPT PERL_MB_OPT PERL_LOCAL_LIB_ROOT
  ./Build install --destdir="${pkgdir}"
}
