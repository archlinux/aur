# Maintainer: Aaron Bishop <erroneous@gmail.com>

pkgname=perl-crypt-openssl-aes
pkgver=0.19
pkgrel=1
pkgdesc="Perl/CPAN Module Crypt::OpenSSL::AES"
arch=('x86_64' 'i686')
url="https://metacpan.org/pod/Crypt::OpenSSL::AES"
license=("GPL" "PerlArtistic")
depends=("openssl" "perl-crypt-openssl-guess")
checkdepends=("perl-file-which")
options=('!emptydirs')
source=("https://cpan.metacpan.org/authors/id/T/TI/TIMLEGGE/Crypt-OpenSSL-AES-${pkgver}.tar.gz")
sha256sums=('35a8af2ebdc26280a4f5916c1a97c3431e7cbef3e7451e1e917f7cce4d8c9c59')

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
