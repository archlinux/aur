# Contributor: Victor van den Elzen <victor.vde@gmail.com>
# Maintainer: François Freitag <mail@franek.fr>
pkgname=pgbadger
pkgver=9.2
pkgrel=1
pkgdesc="a fast PostgreSQL log analysis report"
arch=("any")
url="https://github.com/dalibo/pgbadger"
license=("custom:PostgreSQL")
depends=(perl)
optdepends=(
  "perl-text-csv-xs: to parse PostgreSQL CSV log files"
  "perl-json-xs: to export statistics as JSON file"
)
options=('!emptydirs' purge)
source=("https://github.com/dalibo/pgbadger/archive/v${pkgver}.tar.gz")
sha256sums=('2107466309a409fb9e40f11bb77cac1f9ba7910d5328e7b2e08eb7a1c6d760ec')

build() {
  cd "$srcdir/pgbadger-$pkgver"
  /usr/bin/perl Makefile.PL
  make
  # Strip unnecesary directory.
  rm --dir "$srcdir/pgbadger-$pkgver/"
}

package() {
  cd "$srcdir/pgbadger-$pkgver"
  make install INSTALLDIRS=vendor DESTDIR="$pkgdir"
}
