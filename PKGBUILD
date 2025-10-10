# Maintainer: "marmis" Tiago de Paula <tiagodepalves@gmail.com>
# Contributor: "marmis" Tiago de Paula <tiagodepalves@gmail.com>
# Contributor: Michał Wojdyła < micwoj9292 at gmail dot com >

pkgname=perl-tree-rb-xs
pkgver=0.07
pkgrel=1
pkgdesc='Red/Black Tree implemented in C, with similar API to Tree::RB'
arch=('any')
url='https://metacpan.org/dist/Tree-RB-XS'
license=('GPL-1.0-or-later OR Artistic-1.0-Perl')
# See https://metacpan.org/release/NERDVANA/Tree-RB-XS-0.07/source/Makefile.PL
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
  'perl-test2-suite>=0.000139'
  # perl-test2-suite: "Test2::V0"
  'perl-time-hires'
)
options=('!emptydirs' 'purge')
source=("https://cpan.metacpan.org/authors/id/N/NE/NERDVANA/Tree-RB-XS-${pkgver}.tar.gz")
b2sums=('bd2d1c513ef3a005d2e558aa6780f9feaea720858ffe0ad2ea67932bce3c831d30258c21f2ad9a8129cea30f584531576160a11a38920e3878367510276415ae')

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
