# Maintainer: Brian Bidulock <bidulock@openss7.org>

pkgname=perl-snmp
_cpanname=SNMP
pkgver=5.0401
pkgrel=1
pkgdesc="Perl/CPAN Module SNMP"
arch=("i686" "x86_64")
url="https://metacpan.org/release/$_cpanname"
license=('BSD')
options=('!emptydirs')
source=("http://cpan.metacpan.org/authors/id/H/HA/HARDAKER/$_cpanname-$pkgver.tar.gz")
depends=('perl')
md5sums=('7deaef5e9375c4dbdbd9b6c3bc1ae5e1')

build() {
  cd "${srcdir}/${_cpanname}-${pkgver}"

  # install module in vendor directories.
  NETSNMP_DONT_CHECK_VERSION=1 \
  PERL_MM_USE_DEFAULT=1 perl Makefile.PL INSTALLDIRS=vendor || return 1 
  make
}
nocheck() {
  cd "${srcdir}/${_cpanname}-${pkgver}"
  make test
}
package() {
  cd "${srcdir}/${_cpanname}-${pkgver}"
  make install DESTDIR="${pkgdir}" || return 1
  
  find "$pkgdir" -name '.packlist' -delete
  find "$pkgdir" -name '*.pod' -delete
}
