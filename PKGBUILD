# Maintainer: éclairevoyant
# Contributor: Jakob Nixdorf <flocke at shadowice dot org>

pkgname=perl-struct-dumb
pkgver=0.15
pkgrel=1
pkgdesc='Make simple lightweight record-like structures'
arch=('any')
url='https://metacpan.org/dist/Struct-Dumb'
license=('GPL-1.0-or-later OR Artistic-1.0-Perl')
# See https://metacpan.org/dist/Struct-Dumb/source/Build.PL
depends=(
  ## requires
  'perl>=5.14'
)
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
b2sums=('23c3b95ea520162cb1b335651b848ca21aa38a373d6432286010891a7ad103271ecc5888816ab71cd91697ad6feb9a13b8e640adab4530ffbb8800933a702c35')


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
