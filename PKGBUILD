# Maintainer: marmis <tiagodepalves@gmail.com>
# Contributor: arojas <arojas@archlinux.org>
# Contributor: Florian Pritz <bluewind@archlinux.org>

pkgname=perl-log-any
pkgver=1.717
pkgrel=4
pkgdesc='Bringing loggers and listeners together'
arch=('any')
url="https://metacpan.org/dist/Log-Any"
license=('GPL-1.0-or-later OR Artistic-1.0-Perl')
# See "prereqs" in https://metacpan.org/dist/Log-Any/source/Makefile.PL
makedepends=(
  ## CONFIGURE_REQUIRES
  'perl-extutils-makemaker'
)
depends=(
  ## PREREQ_PM
)
checkdepends=(
  ## TEST_REQUIRES
  'perl-extutils-makemaker'
  'perl-pathtools' # "File::Spec"
  'perl-io' # "IO::Handle"
  'perl' # "IPC::Open3"
  'perl-test-simple' # "Test::More"
)
options=('!emptydirs' 'purge')
source=("https://cpan.metacpan.org/authors/id/P/PR/PREACTION/Log-Any-${pkgver}.tar.gz")
b2sums=('fc2d4e6d1869c4699092bb27bd65f1ac09f58003fc5e849541f2b27e1e18f2e1e4b762a44b444b5a3d0e8a4df303623b4a289fdee8d08b9a67d760ebc8166eda')

build() {
  cd "${srcdir}/Log-Any-${pkgver}"

  unset PERL5LIB PERL_MM_OPT PERL_LOCAL_LIB_ROOT
  export PERL_MM_USE_DEFAULT=1 PERL_AUTOINSTALL=--skipdeps
  perl Makefile.PL NO_PACKLIST=true NO_PERLLOCAL=true INSTALLDIRS=vendor
  make
}

check() {
  cd "${srcdir}/Log-Any-${pkgver}"

  unset PERL5LIB PERL_MM_OPT PERL_LOCAL_LIB_ROOT
  export PERL_MM_USE_DEFAULT=1
  make test
}

package() {
  cd "${srcdir}/Log-Any-${pkgver}"

  unset PERL5LIB PERL_MM_OPT PERL_LOCAL_LIB_ROOT
  make install DESTDIR="${pkgdir}"
}
