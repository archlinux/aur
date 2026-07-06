# Maintainer: marmis <tiagodepalves@gmail.com>
# Contributor: "marmis" Tiago de Paula <tiagodepalves@gmail.com>

pkgname=perl-feature-compat-class
pkgdesc="Make 'class' syntax available in older Perl versions"
pkgver=0.08
pkgrel=1
url='https://metacpan.org/dist/Feature-Compat-Class'
arch=(any)
license=('GPL-1.0-or-later OR Artistic-1.0-Perl')
# See https://metacpan.org/dist/Feature-Compat-Class/source/Build.PL
depends=(
  ## requires
  'perl>=5.14'
)
optdepends=(
  'perl-object-pad>=0.823: support for Perl versions older than 5.40'
)
checkdepends=(
  ## tests_requires
  'perl-test-simple>=1.302200' # "Test2::V0"
)
makedepends=(
  ## configure_requires
  'perl-module-build>=0.4004'
)
options=(!emptydirs)
source=("https://cpan.metacpan.org/authors/id/P/PE/PEVANS/Feature-Compat-Class-${pkgver}.tar.gz")
b2sums=('4b24a85e8a0f318b4561b59016dfbd9a434d2b3f04e451f2076fa42c1dc96375dd5ee033e7ad1d8990b2dd80efebd4a3bae0e5cba6e1a650dea1e153a0d91a1b')

build() {
  cd "Feature-Compat-Class-${pkgver}"

  unset PERL_MB_OPT PERL5LIB PERL_LOCAL_LIB_ROOT
  export PERL_MM_USE_DEFAULT=1 MODULEBUILDRC=/dev/null
  /usr/bin/perl Build.PL --create_packlist=0
  ./Build
}

check() {
  cd "Feature-Compat-Class-${pkgver}"

  unset PERL5LIB PERL_LOCAL_LIB_ROOT
  ./Build test
}

package() {
  cd "Feature-Compat-Class-${pkgver}"

  unset PERL5LIB PERL_LOCAL_LIB_ROOT
  ./Build install --installdirs=vendor --destdir="${pkgdir}"
}
