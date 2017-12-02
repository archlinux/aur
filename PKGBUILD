# Maintainer: François Freitag <mail at franek dot fr>
# Contributor: Victor van den Elzen <victor.vde at gmail dot com>
pkgname=pgbadger
pkgver=9.2
pkgrel=2
pkgdesc="A fast PostgreSQL log analysis report"
arch=("any")
url="https://github.com/dalibo/pgbadger"
license=("custom:Dalibo")
depends=('perl>=5.10.0')
optdepends=(
  "perl-text-csv-xs: parse PostgreSQL CSV log files"
  "perl-json-xs: export statistics as JSON file"
)
options=('!emptydirs')
source=("https://github.com/dalibo/pgbadger/archive/v${pkgver}.tar.gz")
sha256sums=('2107466309a409fb9e40f11bb77cac1f9ba7910d5328e7b2e08eb7a1c6d760ec')

build() {
  cd "${srcdir}/pgbadger-${pkgver}"
  /usr/bin/perl Makefile.PL
  make
}

package() {
  cd "${srcdir}/pgbadger-${pkgver}"

  install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
  make pure_vendor_install INSTALLDIRS=vendor DESTDIR="${pkgdir}"

  # Remove perllocal.pod and .packlist
  find "${pkgdir}" \( -name .packlist -o -name perllocal.pod \) -delete
}
