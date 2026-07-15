# Maintainer: Aaron Bishop <erroneous@gmail.com>

pkgname=perl-crypt-openssl-aes
pkgver=0.23
pkgrel=1
pkgdesc="Perl/CPAN Module Crypt::OpenSSL::AES"
arch=('x86_64' 'i686')
url="https://metacpan.org/pod/Crypt::OpenSSL::AES"
license=("GPL" "PerlArtistic")
depends=("openssl" "perl-crypt-openssl-guess")
checkdepends=("perl-file-which" "perl-crypt-urandom")
options=('!emptydirs')
source=("https://cpan.metacpan.org/authors/id/T/TI/TIMLEGGE/Crypt-OpenSSL-AES-${pkgver}.tar.gz")
sha256sums=('a70bc89c8d5eabde9b83dec7131b756c247b5c1fb8980f23a42bdd47751d4887')

build() {
  cd Crypt-OpenSSL-AES-${pkgver}

  perl Makefile.PL INSTALLDIRS=vendor

  make
}

package() {
  cd Crypt-OpenSSL-AES-${pkgver}

  make install DESTDIR="$pkgdir"

  find "$pkgdir" -name '.packlist' -delete
  find "$pkgdir" -name '*.pod' -delete
  mkdir -p "${pkgdir}/usr/share/licenses/${pkgname}"
  install LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

check() {
  cd Crypt-OpenSSL-AES-${pkgver}
  make test
}
