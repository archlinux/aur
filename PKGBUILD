# Maintainer: Shingo Kawamura <pannakoota1@gmail.com>
pkgname=jq-lite
pkgver=2.22
pkgrel=1
pkgdesc="Lightweight jq-like JSON query engine in Perl"
arch=('any')
options=(!emptydirs)
url="https://metacpan.org/release/JQ-Lite"
license=('Artistic-1.0-Perl' 'GPL-1.0-or-later')
depends=('perl')
makedepends=('perl-extutils-makemaker')
source=("https://cpan.metacpan.org/authors/id/S/SH/SHINGO/JQ-Lite-${pkgver}.tar.gz")
sha256sums=('2d318b98dfc9ecf6ff08e18b3614a80b7eab0e0a1a5f5667374b3e9c6fd889a9')

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

