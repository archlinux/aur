# Maintainer: marmis <tiagodepalves@gmail.com>
# Contributor: micwoj92
# Contributor: "marmis" Tiago de Paula <tiagodepalves@gmail.com>
# Contributor: arojas <arojas@archlinux.org>
# Contributor: Florian Pritz <bluewind@archlinux.org>

pkgname=perl-log-any
pkgver=1.719
pkgrel=1
pkgdesc='Bringing loggers and listeners together'
arch=('any')
url='https://metacpan.org/dist/Log-Any'
license=('GPL-1.0-or-later OR Artistic-1.0-Perl')
# See https://metacpan.org/dist/Log-Any/source/Makefile.PL
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
  'perl-pathtools'   # "File::Spec"
  'perl-io'          # "IO::Handle"
  'perl'             # "IPC::Open3"
  'perl-test-simple' # "Test::More"

  ## t/proxy-with-stack-trace.t
  'perl-devel-stacktrace>=2.00'
)
optdepends=(
  # See https://github.com/preaction/Log-Any/commit/c2cc64c245f90068f7135895e3c3f642d587703c
  'perl-devel-stacktrace>=2.00: for Log::Any::Proxy::WithStackTrace'
)
options=(!emptydirs)
source=("https://cpan.metacpan.org/authors/id/P/PR/PREACTION/Log-Any-${pkgver}.tar.gz")
b2sums=('d4f7a306766b06c70342c1400b7040bf50883deea6e1bc1355c5f47cb590a51e2a35d2f9ee80f6cc4eff928f8ed4c1e2c13230c21a37e9796b1d3d4230a2e9b2')

build() {
  cd "${srcdir}/Log-Any-${pkgver}"

  unset PERL_MM_OPT PERL5LIB PERL_LOCAL_LIB_ROOT
  export PERL_MM_USE_DEFAULT=1 PERL_AUTOINSTALL=--skipdeps
  /usr/bin/perl Makefile.PL NO_PACKLIST=1 NO_PERLLOCAL=1
  make
}

check() {
  cd "${srcdir}/Log-Any-${pkgver}"

  unset PERL5LIB PERL_LOCAL_LIB_ROOT
  make test
}

package() {
  cd "${srcdir}/Log-Any-${pkgver}"

  unset PERL5LIB PERL_LOCAL_LIB_ROOT
  make install INSTALLDIRS=vendor DESTDIR="${pkgdir}"
}
