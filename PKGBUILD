# Maintainer: "marmis" Tiago de Paula <tiagodepalves@gmail.com>
# Contributor: "marmis" Tiago de Paula <tiagodepalves@gmail.com>
# Contributor: Michał Wojdyła < micwoj9292 at gmail dot com >

pkgname=perl-tree-rb-xs
pkgver=0.19
pkgrel=1
pkgdesc='Red/Black Tree and LRU Cache implemented in C'
arch=('any')
url='https://metacpan.org/dist/Tree-RB-XS'
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
options=(!emptydirs purge)
source=("https://cpan.metacpan.org/authors/id/N/NE/NERDVANA/Tree-RB-XS-${pkgver}.tar.gz")
b2sums=('06b34a7fcd98bc1067c328aa34290e7535ffb05c1df810688c247f1949aad208e9674374c918558b00cd730e211b8922b1cd84cb9b4dfb9c8132087d0c8da79a')

build() {
  cd "${srcdir}/Tree-RB-XS-${pkgver}"

  export PERL_MM_USE_DEFAULT=1 PERL_AUTOINSTALL=--skipdeps
  /usr/bin/perl Makefile.PL NO_PACKLIST=true NO_PERLLOCAL=true INSTALLDIRS=vendor
  make
}

check() {
  cd "${srcdir}/Tree-RB-XS-${pkgver}"

  export PERL_MM_USE_DEFAULT=1
  make test
}

package() {
  cd "${srcdir}/Tree-RB-XS-${pkgver}"

  make install DESTDIR="${pkgdir}"
}
