# Maintainer: marmis <tiagodepalves@gmail.com>
# Contributor: micwoj92
# Contributor: "marmis" Tiago de Paula <tiagodepalves@gmail.com>
# Contributor: arojas <arojas@archlinux.org>
# Contributor: Florian Pritz <bluewind@archlinux.org>

pkgname=perl-log-any
pkgver=1.720
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
b2sums=('1b9a713e7c99ede7aeaa0d58ae4b6a5ed7bdbf8f8202d2924aa9f6200841dc6cc4e0bface283bcdd66caf55d07ad91143074f24387bd37afc1a8fde17ef39bb9')

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
