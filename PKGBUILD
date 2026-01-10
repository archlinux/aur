# Maintainer: Shingo Kawamura <pannakoota1@gmail.com>
pkgname=jq-lite
pkgver=2.08
pkgrel=1
pkgdesc="Lightweight jq-like JSON query engine in Perl"
arch=('any')
options=(!emptydirs)
url="https://metacpan.org/release/JQ-Lite"
license=('Artistic-1.0-Perl' 'GPL-1.0-or-later')
depends=('perl')
makedepends=('perl-extutils-makemaker')
source=("https://cpan.metacpan.org/authors/id/S/SH/SHINGO/JQ-Lite-${pkgver}.tar.gz")
sha256sums=('8cb3676612a7f485f790716554f1e1a4d3e984e2e0c4854cf7cb6009488c2399')

build() {
  cd "JQ-Lite-${pkgver}"
  perl Makefile.PL INSTALLDIRS=vendor NO_PERLLOCAL=1
  make
}

check() {
  cd "JQ-Lite-${pkgver}"
  make test
}

package() {
  cd "JQ-Lite-${pkgver}"
  make install DESTDIR="${pkgdir}" INSTALLDIRS=vendor

  # Safety net: remove any remaining empty directories
  find "${pkgdir}" -type d -empty -delete
}

