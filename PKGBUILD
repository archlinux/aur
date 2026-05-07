# Maintainer: Jimmy Xu <me at jimmyxu dot org>

_perlmod='Crypt-SMIME'
_modnamespace=Crypt/MIKAGE
pkgname=perl-crypt-smime
pkgver=0.33
pkgrel=1
pkgdesc="S/MIME message signing, verification, encryption and decryption"
arch=("any")
url="http://search.cpan.org/dist/$_perlmod"
license=('Artistic-1.0-Perl OR GPL-1.0-or-later')
depends=('perl')
makedepends=('perl-extutils-cchecker' 'perl-extutils-pkgconfig')
checkdepends=('perl-test-exception')
options=('!emptydirs')
source=("https://cpan.perl.org/modules/by-module/$_modnamespace/$_perlmod-$pkgver.tar.gz")
sha256sums=('b47a0349403954569c08196290db9d14a098078044f6131f48bc54916f4d6f5c')

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
