# Maintainer: marmis <tiagodepalves@gmail.com>
# Contributor: "marmis" Tiago de Paula <tiagodepalves@gmail.com>

pkgname=perl-test2-tools-command
pkgver=0.20
pkgrel=2
pkgdesc='Test simple unix commands in Perl'
arch=('any')
url='https://metacpan.org/dist/Test2-Tools-Command'
license=('BSD-3-Clause')
# See https://metacpan.org/dist/Test2-Tools-Command/source/Build.PL
makedepends=(
  ## configure_requires
  'perl-module-build>=0.4004'
)
checkdepends=(
  ## tests_requires
  'perl-pathtools' # 'File::Spec'
  'perl-test-simple>=0.000060' # 'Test2::V0'
)
depends=(
  ## requires
  'perl>=5.10'
  'perl-file-chdir'
  # perl: 'IPC::Open3'
  # perl: 'Symbol'
  'perl-test-simple' # 'Test2::V0'
)
options=('!emptydirs' 'purge')
source=("https://cpan.metacpan.org/authors/id/J/JM/JMATES/Test2-Tools-Command-${pkgver}.tar.gz")
b2sums=('790d27943feaa1f521fa8168766ec5758606b882240bf87c9fc37da00b5158b88ac6eeac4d1228e9d1c5256d7b40ba81e0cff893fa46d7c5e6c2c857f4b25f64')

build() {
  cd "${srcdir}/Test2-Tools-Command-${pkgver}"

  unset PERL5LIB PERL_MM_OPT PERL_MB_OPT PERL_LOCAL_LIB_ROOT
  export PERL_MM_USE_DEFAULT=1 MODULEBUILDRC=/dev/null
  perl Build.PL --installdirs=vendor --create_packlist=0
  ./Build
}

check() {
  cd "${srcdir}/Test2-Tools-Command-${pkgver}"

  unset PERL5LIB PERL_MM_OPT PERL_MB_OPT PERL_LOCAL_LIB_ROOT
  export PERL_MM_USE_DEFAULT=1
  ./Build test
}

package() {
  cd "${srcdir}/Test2-Tools-Command-${pkgver}"

  unset PERL5LIB PERL_MM_OPT PERL_MB_OPT PERL_LOCAL_LIB_ROOT
  ./Build install --destdir="${pkgdir}"

  # BSD licenses require the full text
  install -D -m644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
