# Maintainer: Giovanni Scafora <giovanni@archlinux.org>
# Contributor: François Charette <firmicus ατ gmx δοτ net>

pkgname=perl-crypt-ssleay
pkgver=0.73_06
pkgrel=3
pkgdesc="OpenSSL glue that provides LWP https support"
arch=('x86_64')
url="https://search.cpan.org/dist/Crypt-SSLeay"
license=('GPL' 'PerlArtistic')
depends=('perl-lwp-protocol-https' 'perl-try-tiny' 'perl-path-class' 'perl-bytes-random-secure')
options=('!emptydirs')
source=("https://www.cpan.org/CPAN/authors/id/N/NA/NANIS/Crypt-SSLeay-$pkgver.tar.gz")
sha256sums=('f8ecca45c87eb91325992b13f0594f808e6f1bc4c3b9a7f141b9a838384d252c')

build() {
  cd  "${srcdir}/Crypt-SSLeay-${pkgver}"

  PERL_USE_UNSAFE_INC=1 \
  PERL_MM_USE_DEFAULT=1 perl Makefile.PL INSTALLDIRS=vendor
  make
}

check() {
  cd  "${srcdir}/Crypt-SSLeay-${pkgver}"

#  make test
}

package() {
  cd  "${srcdir}/Crypt-SSLeay-${pkgver}"

  make install DESTDIR="${pkgdir}"

  find "${pkgdir}" -name '.packlist' -delete
  find "${pkgdir}" -name '*.pod' -delete
}
