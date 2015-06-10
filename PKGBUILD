# Maintainer: Brian Bidulock <bidulock@openss7.org>
# Contributor: Pranay Kanwar <pranay.kanwar@gmail.com>

pkgname=perl-net-packet
_cpanname=Net-Packet
_module=Net::Packet
pkgver=3.27
pkgrel=2
pkgdesc="$_module - unified framework to send a receive packets"
arch=('any')
url="https://metacpan.org/release/${_cpanname}"
license=('GPL' 'PerlArtistic')
depends=('perl-net-ipv4addr' 'perl-bit-vector' 'perl-net-write>=1.00' 'perl-socket6' 'perl-net-pcap>=0.12' 'perl-net-libdnet' 'perl-class-gomor>=1.00' 'perl-net-ipv6addr')
makedepends=('perl-extutils-makemaker')
checkdepends=('perl-net-pcap')
options=('!emptydirs')
source=("http://cpan.metacpan.org/authors/id/G/GO/GOMOR/${_cpanname}-${pkgver}.tar.gz")
md5sums=('1f1d0b19b043d47dd30d21d5cf02e1e7')

build() {
  cd "$srcdir/$_cpanname-$pkgver"
  sed -i '/^auto_install/d' Makefile.PL
  PERL_MM_USE_DEFAULT=1 perl Makefile.PL INSTALLDIRS=vendor
  make
}

check() {
  cd "$srcdir/$_cpanname-$pkgver"
  make test
}

package() {
  cd "$srcdir/$_cpanname-$pkgver"
  make install DESTDIR="$pkgdir"
  find "$pkgdir" -name '.packlist' -o -name '*.pod' -delete
}

# vim:set ts=2 sw=2 et:
