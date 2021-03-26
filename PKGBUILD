# Maintainer: xiretza <xiretza+aur@gmail.com>
_perlmod="Crypt-OpenSSL-X509"
_modnamespace=Crypt
pkgname=perl-crypt-openssl-x509
pkgver=1.902
pkgrel=2
pkgdesc="Perl extension to OpenSSL's X509 API"
arch=(x86_64)
url="http://search.cpan.org/dist/$_perlmod"
license=('GPL' 'PerlArtistic')
depends=('perl' 'openssl')
checkdepends=('perl-test-pod')
source=("http://cpan.perl.org/modules/by-module/$_modnamespace/$_perlmod-$pkgver.tar.gz")
sha512sums=('7e870701fb90ea3c5f58a5d5c31a3e4ab87fcb6e4f0670272a07fb120e1bd19880f63fbcd41ebdac9f75a855a914db7f3d7f23cd032db50c2989e831c9c99d42')

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
