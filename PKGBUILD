# Maintainer: marmis <tiagodepalves@gmail.com>
# Contributor: "marmis" Tiago de Paula <tiagodepalves@gmail.com>
# Contributor: Michał Wojdyła < micwoj9292 at gmail dot com >

pkgname=perl-tree-rb-xs
pkgdesc='Red/Black Tree and LRU Cache implemented in C'
pkgver=0.21
pkgrel=1
url='https://metacpan.org/dist/Tree-RB-XS'
arch=(aarch64 armv7h i486 i686 pentium4 riscv64 x86_64)
license=('GPL-1.0-or-later OR Artistic-1.0-Perl')
# See https://metacpan.org/dist/Tree-RB-XS/source/Makefile.PL
makedepends=(
  ## CONFIGURE_REQUIRES
  'perl-extutils-depends>=0.405'
  'perl-extutils-makemaker'
)
depends=(
  ## PREREQ_PM
  'perl-carp'
  'perl-exporter'
  'perl-scalar-list-utils' # "Scalar::Util"
  'perl-xsloader'
  'perl' # "strict", "warnings"
)
checkdepends=(
  ## TEST_REQUIRES
  'perl-findbin'
  'perl-storable'
  'perl-test-simple>=1.302200' # "Test2::Suite", "Test2::Tools::Subtest", "Test2::V0"
  'perl-time-hires'
  'perl-lib'
  'perl-parent'
)
options=(!emptydirs)
source=("https://cpan.metacpan.org/authors/id/N/NE/NERDVANA/Tree-RB-XS-${pkgver}.tar.gz")
b2sums=('8e8ccd375174c064c7c18ca9521d4a516c2d54478b24f249627ddcdfc51f42ad390424a23cfd7b1a907ac74c0a38e5364f698cfb28d0590048c1a0344f5e5898')

build() {
  cd "Tree-RB-XS-${pkgver}"

  unset PERL_MM_OPT PERL5LIB PERL_LOCAL_LIB_ROOT
  export PERL_MM_USE_DEFAULT=1 PERL_AUTOINSTALL=--skipdeps
  /usr/bin/perl Makefile.PL NO_PACKLIST=1 NO_PERLLOCAL=1
  make
}

check() {
  cd "Tree-RB-XS-${pkgver}"

  unset PERL5LIB PERL_LOCAL_LIB_ROOT
  make test
}

package() {
  cd "Tree-RB-XS-${pkgver}"

  unset PERL5LIB PERL_LOCAL_LIB_ROOT
  make install INSTALLDIRS=vendor DESTDIR="${pkgdir}"

  # makepkg won't strip binaries if they are not writable
  chmod -c -R u+w "${pkgdir}"
}
