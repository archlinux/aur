# Maintainer: Brian Bidulock <bidulock@openss7.org>

pkgname=perl-snmp-info
_cpanname=SNMP-Info
pkgver=3.13
pkgrel=1
pkgdesc="Perl/CPAN Module SNMP::Info"
arch=('any')
url="https://metacpan.org/release/$_cpanname"
license=('BSD')
options=('!emptydirs')
source=("http://cpan.metacpan.org/authors/id/O/OL/OLIVER/$_cpanname-$pkgver.tar.gz")
depends=('perl' 'net-snmp')
md5sums=('99ab6ba5f991c81adb0c59ac776d88d3')

build() {
  cd "${srcdir}/${_cpanname}-${pkgver}"

  # install module in vendor directories.
  PERL_MM_USE_DEFAULT=1 perl Makefile.PL INSTALLDIRS=vendor || return 1 
  make
}
check() {
  cd "${srcdir}/${_cpanname}-${pkgver}"
  make test
}
package() {
  cd "${srcdir}/${_cpanname}-${pkgver}"
  make install DESTDIR="${pkgdir}" || return 1
  install -Dm0644 COPYRIGHT "$pkgdir/usr/share/licenses/$pkgname/COPYRIGHT"
  
  find "$pkgdir" -name '.packlist' -delete
  find "$pkgdir" -name '*.pod' -delete
}
