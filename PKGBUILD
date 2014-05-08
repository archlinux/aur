# Maintainer: Brian Bidulock <bidulock@openss7.org>

pkgname=perl-snmp-info
_cpanname=SNMP-Info
pkgver=2.11
pkgrel=1
pkgdesc="Perl/CPAN Module SNMP::Info"
arch=('any')
url="https://metacpan.org/release/$_cpanname"
license=('unknown')
options=('!emptydirs')
source=("http://cpan.metacpan.org/authors/id/O/OL/OLIVER/$_cpanname-$pkgver.tar.gz")
depends=('perl' 'net-snmp')
md5sums=('02d3600cae3d59297be9533f49e64115')

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
  
  find "$pkgdir" -name '.packlist' -delete
  find "$pkgdir" -name '*.pod' -delete
}
