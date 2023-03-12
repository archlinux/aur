# Maintainer: xiretza <xiretza+aur@gmail.com>
_perlmod="Crypt-OpenSSL-X509"
_modnamespace=Crypt
pkgname=perl-crypt-openssl-x509
pkgver=1.914
pkgrel=2
pkgdesc="Perl extension to OpenSSL's X509 API"
arch=(x86_64)
url="http://search.cpan.org/dist/$_perlmod"
license=('GPL' 'PerlArtistic')
depends=('perl' 'perl-convert-asn1' 'perl-crypt-openssl-guess' 'openssl')
checkdepends=('perl-test-pod')
source=("http://cpan.perl.org/modules/by-module/$_modnamespace/$_perlmod-$pkgver.tar.gz")
sha512sums=('5bb18e70120bf03fa20af122d5215d7aff073d8e02df599197df036801470b4ebccd50f44eeb7cadf2e1bd21f5d73f21a03ce3ca3e3fabf6e062dd959cbbfa23')

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
