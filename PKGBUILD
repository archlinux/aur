# Maintainer: xiretza <xiretza+aur@gmail.com>
_perlmod="Crypt-OpenSSL-X509"
_modnamespace=Crypt
pkgname=perl-crypt-openssl-x509
pkgver=1.910
pkgrel=1
pkgdesc="Perl extension to OpenSSL's X509 API"
arch=(x86_64)
url="http://search.cpan.org/dist/$_perlmod"
license=('GPL' 'PerlArtistic')
depends=('perl' 'openssl')
checkdepends=('perl-test-pod')
source=("http://cpan.perl.org/modules/by-module/$_modnamespace/$_perlmod-$pkgver.tar.gz")
sha512sums=('6ddb5358f4a96cae85a016143f3fec11bd715dcf47a0aa694587bc09077a5067be7a22fe16be0e47b7bd59d2db826d03801737482a812f4cff3a51ff7da0d6ad')

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
