# Maintainer: Brian Bidulock <bidulock@openss7.org>
# Contributor: Alessandro Nakamuta <alessandro dot nakamuta at archlinux dot com dot br>

pkgname=perl-net-pcaputils
_cpanname=Net-PcapUtils
pkgver=0.01
pkgrel=3
pkgdesc="Perl/CPAN Module Net::PcapUtils"
arch=('any')
url="https://metacpan.org/release/$_cpanname"
license=("GPL" "PerlArtistic")
options=('!emptydirs')
source=("http://cpan.metacpan.org/authors/id/T/TI/TIMPOTTER/${_cpanname}-${pkgver}.tar.gz")
depends=('perl-net-pcap')
md5sums=('eeba67266dbe155b504df3c2de1d657f')

build() {
  cd "${srcdir}/${_cpanname}-${pkgver}"

  # install module in vendor directories.
  PERL_MM_USE_DEFAULT=1 perl Makefile.PL INSTALLDIRS=vendor
  make
}
package() {
  cd "${srcdir}/${_cpanname}-${pkgver}"
  make install DESTDIR="${pkgdir}"
  
  find "$pkgdir" -name '.packlist' -delete
  find "$pkgdir" -name '*.pod' -delete
}
