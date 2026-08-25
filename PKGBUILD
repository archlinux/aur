# Maintainer: Jimmy Xu <me at jimmyxu dot org>

_perlmod='Mail-DMARC'
_modnamespace=Mail/MSIMERSON
pkgname=perl-mail-dmarc
pkgver=2.20260724
pkgrel=1
pkgdesc="Perl implementation of DMARC"
arch=("any")
url="http://search.cpan.org/dist/$_perlmod"
license=('Artistic-1.0-Perl OR GPL-1.0-or-later')
depends=('perl' 'perl-cgi' 'perl-config-tiny' 'perl-dbd-sqlite' 'perl-dbix-simple' 'perl-email-mime' 'perl-email-simple' 'perl-file-sharedir' 'perl-file-sharedir-install' 'perl-http-message' 'perl-io-socket-ssl' 'perl-json' 'perl-libwww' 'perl-mail-dkim' 'perl-module-build' 'perl-net-dns' 'perl-net-http' 'perl-net-idn-encode' 'perl-net-ip' 'perl-net-smtps' 'perl-net-ssleay' 'perl-net-server' 'perl-regexp-common' 'perl-socket6' 'perl-uri' 'perl-xml-libxml')
makedepends=('perl-email-sender' 'perl-module-pluggable' 'perl-test-file-sharedir' 'perl-test-exception' 'perl-test-output')
checkdepends=('perl-net-dns-resolver-mock')
options=('!emptydirs')
source=("https://cpan.perl.org/modules/by-module/$_modnamespace/$_perlmod-$pkgver.tar.gz")
sha256sums=('1e90900a655430318ea1e721869f406d0d05ce46ac84d48835aeb1b85a1221d0')

build() {
  cd "$srcdir/$_perlmod-$pkgver"

  # Install module in vendor directories.
  PERL_MM_USE_DEFAULT=1 perl Makefile.PL INSTALLDIRS=vendor
  make
}

check() {
  cd "$srcdir/$_perlmod-$pkgver"

  # Install module in vendor directories.
  PERL_MM_USE_DEFAULT=1 perl Makefile.PL INSTALLDIRS=vendor
  make test
}

package() {
  cd "$srcdir/$_perlmod-$pkgver"
  make install DESTDIR="$pkgdir/"
}

# vim:set ts=2 sw=2 et:
