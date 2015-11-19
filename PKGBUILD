# Maintainer: Jonathan Liu <net147@gmail.com>
# Contributor: Kevin Piche <kevin@archlinux.org>
# Contributor: K. Piche <kpiche@rogers.com>

pkgname=swatchdog
pkgver=3.2.4
pkgrel=1
pkgdesc="The active log file monitoring tool"
arch=('any')
license=('GPL')
url="http://swatch.sourceforge.net/"
depends=('perl-date-calc' 'perl-date-manip' 'perl-file-tail' 'perl-timedate' 'perl>=5.10.0')
source=("http://downloads.sourceforge.net/sourceforge/swatch/${pkgname}-${pkgver}.tar.gz")
provides=('swatch')
conflicts=('swatch')
replaces=('swatch')
options=('!emptydirs')
md5sums=('df4c20ff7d3f6a46a2efd72a42078011')

build() {
  cd "${pkgname}-${pkgver}"
  unset PERL5LIB PERL_MM_OPT PERL_LOCAL_LIB_ROOT
  export PERL_MM_USE_DEFAULT=1 PERL_AUTOINSTALL=--skipdeps
  /usr/bin/perl Makefile.PL INSTALLDIRS=vendor
  make
}

package() {
  cd "${pkgname}-${pkgver}"
  unset PERL5LIB PERL_MM_OPT PERL_LOCAL_LIB_ROOT
  make install INSTALLDIRS=vendor DESTDIR="${pkgdir}"
}

check() {
  cd "${pkgname}-${pkgver}"
  unset PERL5LIB PERL_MM_OPT PERL_LOCAL_LIB_ROOT
  export PERL_MM_USE_DEFAULT=1
  make test
}

# vim:set ts=2 sw=2 et:
