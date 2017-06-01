# Contributor: Victor van den Elzen <victor.vde@gmail.com>
pkgname=pgbadger
pkgver=9.1
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
sha256sums=('2fd7166d74692cc7d87f00b37cc5c7c1c6eddf156372376d382a40f67d694011')

build() {
  cd "$srcdir/pgbadger-$pkgver"
  unset PERL5LIB PERL_MM_OPT PERL_LOCAL_LIB_ROOT
  export PERL_MM_USE_DEFAULT=1 PERL_AUTOINSTALL=--skipdeps
  /usr/bin/perl Makefile.PL
  make
}

check() {
  cd "$srcdir/pgbadger-$pkgver"
  unset PERL5LIB PERL_MM_OPT PERL_LOCAL_LIB_ROOT
  export PERL_MM_USE_DEFAULT=1
  make test
}

package() {
  cd "$srcdir/pgbadger-$pkgver"
  unset PERL5LIB PERL_MM_OPT PERL_LOCAL_LIB_ROOT
  make install INSTALLDIRS=vendor DESTDIR="$pkgdir"
}

