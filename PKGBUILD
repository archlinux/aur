# Maintainer: Chad Harp <chad dot harp at mac dot com>
# Contributor: FadeMind <fademind at gmail dot com>
# Contributor: TDY <tdy at archlinux dot info>
# Contributor: Sven Salzwedel <sven_salzwedel at web dot de>
# Contributor: Olaf Leidinger <leidola at newcon dot de>

pkgname=perl-pdf-api2
pkgver=2.031
pkgrel=1
pkgdesc="A module chain to faciliate the creation and modification of high-quality PDF files"
_dist=PDF-API2
arch=('any')
url="https://metacpan.org/release/PDF-API2"
license=('LGPL')
depends=('perl>=5.8.5' 'perl-font-ttf')
options=('!emptydirs' 'purge')
source=("$_dist-$pkgver.tar.gz::http://cpan.metacpan.org/authors/id/S/SS/SSIMMS/$_dist-$pkgver.tar.gz")
sha256sums=('6ea5d38f99dfb1e8acf57c9c7579659b3eee84944295a135f90e607e0a3f43e9')

build() {
  cd "$srcdir/$_dist-$pkgver"
  unset PERL5LIB PERL_MM_OPT PERL_LOCAL_LIB_ROOT
  export PERL_MM_USE_DEFAULT=1 PERL_AUTOINSTALL=--skipdeps
  /usr/bin/perl Makefile.PL
  make
}

check() {
  cd "$srcdir/$_dist-$pkgver"
  unset PERL5LIB PERL_MM_OPT PERL_LOCAL_LIB_ROOT
  export PERL_MM_USE_DEFAULT=1
  make test
}

package() {
  cd "$srcdir/$_dist-$pkgver"
  unset PERL5LIB PERL_MM_OPT PERL_LOCAL_LIB_ROOT
  make install INSTALLDIRS=vendor DESTDIR="$pkgdir"
}

# vim:set ts=2 sw=2 et:
