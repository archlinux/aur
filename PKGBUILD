# Maintainer: Jimmy Xu <me at jimmyxu dot org>

_perlmod='Crypt-SMIME'
_modnamespace=Crypt
pkgname=perl-crypt-smime
pkgver=0.31
pkgrel=1
pkgdesc="S/MIME message signing, verification, encryption and decryption"
arch=("any")
url="http://search.cpan.org/dist/$_perlmod"
license=('Artistic-1.0-Perl OR GPL-1.0-or-later')
depends=('perl')
makedepends=('perl-extutils-cchecker' 'perl-extutils-pkgconfig')
checkdepends=('perl-test-exception')
options=('!emptydirs')
source=("http://cpan.perl.org/modules/by-module/$_modnamespace/$_perlmod-$pkgver.tar.gz")
sha256sums=('b25ea2c4a0e4c9e6ab06d3cc6b1cc1e10f5486f27dfd0ef2e064e6569769aa9c')

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
