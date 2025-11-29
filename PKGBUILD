# Maintainer: marmis <tiagodepalves@gmail.com>
# Contributor: "marmis" Tiago de Paula <tiagodepalves@gmail.com>

pkgname=perl-feature-compat-class
pkgver=0.07
pkgrel=3
pkgdesc="Make 'class' syntax available in older Perl versions"
arch=('any')
url='https://metacpan.org/dist/Feature-Compat-Class'
license=('GPL-1.0-or-later OR Artistic-1.0-Perl')
# See https://metacpan.org/dist/Feature-Compat-Class/source/Build.PL
depends=(
  ## requires
  'perl>=5.14'
)
optdepends=(
  'perl-object-pad>=0.806: support for Perl versions older than 5.40'
)
checkdepends=(
  ## tests_requires
  'perl-test-simple>=0.88' # 'Test::More'
)
makedepends=(
  ## configure_requires
  'perl-module-build>=0.4004'
)
options=(!emptydirs purge)
source=("https://cpan.metacpan.org/authors/id/P/PE/PEVANS/Feature-Compat-Class-${pkgver}.tar.gz")
b2sums=('69675b5fb0a4586eb9418fcb07f699801cce18384c674fc2a27d48d49749e5a373d214418b366b16fb8c844e9565409b39b6fd940b578e837346004259af32a5')

build() {
  cd "${srcdir}/Feature-Compat-Class-${pkgver}"

  unset PERL5LIB PERL_MM_OPT PERL_MB_OPT PERL_LOCAL_LIB_ROOT
  export PERL_MM_USE_DEFAULT=1 MODULEBUILDRC=/dev/null
  perl Build.PL --installdirs=vendor --create_packlist=0
  ./Build
}

check() {
  cd "${srcdir}/Feature-Compat-Class-${pkgver}"

  unset PERL5LIB PERL_MM_OPT PERL_MB_OPT PERL_LOCAL_LIB_ROOT
  export PERL_MM_USE_DEFAULT=1
  ./Build test
}

package() {
  cd "${srcdir}/Feature-Compat-Class-${pkgver}"

  unset PERL5LIB PERL_MM_OPT PERL_MB_OPT PERL_LOCAL_LIB_ROOT
  ./Build install --destdir="${pkgdir}"
}
