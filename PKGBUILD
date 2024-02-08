# Maintainer: Jakob Gahde <j5lx@fmail.co.uk>
# Contributor: John D Jones III <jnbek1972 -_AT_- g m a i l -_Dot_- com>

pkgname=perl-dbix-simple
pkgver=1.37
pkgrel=2
pkgdesc="Very complete easy-to-use OO interface to DBI"
arch=('any')
license=('LicenseRef-OSI-Any')
depends=('perl-dbi')
makedepends=('perl-pod-parser')
checkdepends=('perl-dbd-sqlite')
url="https://metacpan.org/dist/DBIx-Simple"
source=("https://www.cpan.org/modules/by-module/DBIx/DBIx-Simple-${pkgver}.tar.gz")
sha512sums=('f79b26bf52db33629950bc95f6c17dd13a2af135deeaf6ff5b0570ad852911fd0d27196636e605a93e9b3d740699110f2ece7abc24fcbbfd08a2f3ddce5d65b0')

build() {
  cd "${srcdir}/DBIx-Simple-${pkgver}"

  perl Makefile.PL NO_PACKLIST=true NO_PERLLOCAL=true
  make
}

check() {
  cd "${srcdir}/DBIx-Simple-${pkgver}"

  make test
}

package() {
  cd "${srcdir}/DBIx-Simple-${pkgver}"

  make install INSTALLDIRS=vendor DESTDIR="${pkgdir}"
  podselect -section LICENSE lib/DBIx/Simple.pm | pod2text > LICENSE
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
