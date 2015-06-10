# Maintainer: Brian Bidulock <bidulock@openss7.org>
# Contributor: Pranay Kanwar <pranay.kanwar@gmail.com>

pkgname=perl-net-write
_cpanname=Net-Write
_module=Net::Write
pkgver=1.07
pkgrel=1
pkgdesc="$_module - a portable interface to open and send raw data to network"
arch=('any')
url="https://metacpan.org/release/${_cpanname}"
license=('GPL' 'PerlArtistic')
depends=('perl-class-gomor' 'perl-socket6' 'perl-net-pcap>=0.12')
options=('!emptydirs')
source=("http://cpan.metacpan.org/authors/id/G/GO/GOMOR/${_cpanname}-${pkgver}.tar.gz")
md5sums=('a3310df977446fcd8004fdbb66a782b5')

build() {
  cd "$srcdir/$_cpanname-$pkgver"
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
