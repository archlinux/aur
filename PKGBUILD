# Maintainer: Aaron Bishop <erroneous@gmail.com>

pkgname=perl-crypt-openssl-aes
pkgver=0.02
pkgrel=4
pkgdesc="Perl/CPAN Module Crypt::OpenSSL::AES"
arch=('any')
url="https://metacpan.org/pod/Crypt::OpenSSL::AES"
license=("GPL" "PerlArtistic")
depends=("curl" "openssl")
options=('!emptydirs')
source=("https://cpan.metacpan.org/authors/id/T/TT/TTAR/Crypt-OpenSSL-AES-${pkgver}.tar.gz")
sha256sums=('b66fab514edf97fc32f58da257582704a210c2b35e297d5c31b7fa2ffd08e908')

prepare() {
  cd Crypt-OpenSSL-AES-${pkgver}
}

build() {
  cd Crypt-OpenSSL-AES-${pkgver}

  PERL_USE_UNSAFE_INC=1 \
  PERL_MM_USE_DEFAULT=1 \
  perl Makefile.PL INSTALLDIRS=vendor

  make
}

package() {
  cd Crypt-OpenSSL-AES-${pkgver}

  make install DESTDIR="$pkgdir"

  find "$pkgdir" -name '.packlist' -delete
  find "$pkgdir" -name '*.pod' -delete
}

check() {
  cd Crypt-OpenSSL-AES-${pkgver}
  make test
}
