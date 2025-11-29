# Maintainer: marmis <tiagodepalves@gmail.com>
# Contributor: "marmis" Tiago de Paula <tiagodepalves@gmail.com>

pkgname=perl-feature-compat-try
pkgver=0.05
pkgrel=3
pkgdesc="Make 'try/catch' syntax available in older Perl versions"
arch=('any')
url='https://metacpan.org/dist/Feature-Compat-Try'
license=('GPL-1.0-or-later OR Artistic-1.0-Perl')
# See https://metacpan.org/dist/Feature-Compat-Try/source/Build.PL
depends=(
  ## requires
  'perl>=5.14'
)
optdepends=(
  'perl-syntax-keyword-try>=0.27: support for Perl versions older than 5.35.8'
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
source=("https://cpan.metacpan.org/authors/id/P/PE/PEVANS/Feature-Compat-Try-${pkgver}.tar.gz")
b2sums=('c713975d02fc5d0eaa439dfb8ab0c905589f4020eb5f8bb49e72a9e77f7fc65818c45e77604fca0a3c1ac09906007d9fa93e9d3d68ec4faa55bc27bde39c4d60')

build() {
  cd "${srcdir}/Feature-Compat-Try-${pkgver}"

  unset PERL5LIB PERL_MM_OPT PERL_MB_OPT PERL_LOCAL_LIB_ROOT
  export PERL_MM_USE_DEFAULT=1 MODULEBUILDRC=/dev/null
  perl Build.PL --installdirs=vendor --create_packlist=0
  ./Build
}

check() {
  cd "${srcdir}/Feature-Compat-Try-${pkgver}"

  unset PERL5LIB PERL_MM_OPT PERL_MB_OPT PERL_LOCAL_LIB_ROOT
  export PERL_MM_USE_DEFAULT=1
  ./Build test
}

package() {
  cd "${srcdir}/Feature-Compat-Try-${pkgver}"

  unset PERL5LIB PERL_MM_OPT PERL_MB_OPT PERL_LOCAL_LIB_ROOT
  ./Build install --destdir="${pkgdir}"
}
