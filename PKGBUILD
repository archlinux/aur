# Maintainer: xiretza <xiretza+aur@gmail.com>
_perlmod="Crypt-OpenSSL-X509"
_modnamespace=Crypt
pkgname=perl-crypt-openssl-x509
pkgver=1.813
pkgrel=1
pkgdesc="Perl extension to OpenSSL's X509 API"
arch=(x86_64)
url="http://search.cpan.org/dist/$_perlmod"
license=('GPL' 'PerlArtistic')
depends=('perl' 'openssl')
checkdepends=('perl-test-pod')
source=("http://cpan.perl.org/modules/by-module/$_modnamespace/$_perlmod-$pkgver.tar.gz")
sha512sums=('e4664de7474e70d8e86abe625bc3529e7fe0daf5be2d09fbccbb888e78f26a0c204f76c1718173cc03ed4e557d7d3b0b84b69bdad4936adafd7aea5eed266369')

build() {
  cd "$srcdir/$_perlmod-$pkgver"

  # Install module in vendor directories.
  PERL_MM_USE_DEFAULT=1 perl Makefile.PL INSTALLDIRS=vendor
  make
}

check() {
  cd "$srcdir/$_perlmod-$pkgver"
  unset PERL5LIB PERL_MM_OPT PERL_LOCAL_LIB_ROOT
  export PERL_MM_USE_DEFAULT=1
  make test
}

package() {
  cd "$srcdir/$_perlmod-$pkgver"
  make install DESTDIR="$pkgdir/"
}

# vim:set ts=2 sw=2 et:
