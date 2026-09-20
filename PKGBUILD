# Maintainer: xiretza <xiretza+aur@gmail.com>
_perlmod="Crypt-OpenSSL-X509"
_author=JONASBN
pkgname=perl-crypt-openssl-x509
pkgver=2.1.5
pkgrel=1
pkgdesc="Perl extension to OpenSSL's X509 API"
arch=(x86_64)
url="http://search.cpan.org/dist/$_perlmod"
license=('GPL' 'PerlArtistic')
depends=('perl' 'perl-convert-asn1' 'perl-crypt-openssl-guess' 'openssl')
checkdepends=('perl-test-pod')
source=("https://cpan.metacpan.org/authors/id/${_author::1}/${_author::2}/$_author/$_perlmod-$pkgver.tar.gz")
sha512sums=('f45f8289e6dad9fa8da9865cf797194159dce8b6a4ede5b56640a7c262fdcd2241771e97c9eefcb3526b355982d187ab0f2e4770ba8b5f775d61b245a2278652')

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
