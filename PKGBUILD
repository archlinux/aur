# Maintainer: marmis <tiagodepalves@gmail.com>
# Contributor: micwoj92
# Contributor: "marmis" Tiago de Paula <tiagodepalves@gmail.com>
# Contributor: arojas <arojas@archlinux.org>
# Contributor: Florian Pritz <bluewind@archlinux.org>

pkgname=perl-log-any
pkgver=1.718
pkgrel=2
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
options=(!emptydirs purge)
source=("https://cpan.metacpan.org/authors/id/P/PR/PREACTION/Log-Any-${pkgver}.tar.gz")
b2sums=('bbf9418026fbc301df7cec3c7a52027215fc7737e1c7678a6a0ae0040143398173e67b0b6c249359490956554e942458a3ae923b060c212b35de08e2cf1af256')

build() {
  cd "${srcdir}/Log-Any-${pkgver}"

  export PERL_MM_USE_DEFAULT=1 PERL_AUTOINSTALL=--skipdeps
  perl Makefile.PL NO_PACKLIST=true NO_PERLLOCAL=true INSTALLDIRS=vendor
  make
}

check() {
  cd "${srcdir}/Log-Any-${pkgver}"

  export PERL_MM_USE_DEFAULT=1
  make test
}

package() {
  cd "${srcdir}/Log-Any-${pkgver}"

  make install DESTDIR="${pkgdir}"
}
