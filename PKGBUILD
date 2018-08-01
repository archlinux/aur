# Maintainer: Giovanni Scafora <giovanni@archlinux.org>
# Contributor: François Charette <firmicus ατ gmx δοτ net>

pkgname=perl-crypt-ssleay
pkgver=0.73_04
pkgrel=9
pkgdesc="OpenSSL glue that provides LWP https support"
arch=('x86_64')
url="http://search.cpan.org/dist/Crypt-SSLeay"
license=('GPL' 'PerlArtistic')
depends=('perl-lwp-protocol-https' 'perl-try-tiny' 'perl-path-class')
options=('!emptydirs')
source=(http://www.cpan.org/CPAN/authors/id/N/NA/NANIS/Crypt-SSLeay-$pkgver.tar.gz)
md5sums=('7508b2a34da2202cc0c78deb59e36526')

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

  find ${pkgdir} -name '.packlist' -delete
  find ${pkgdir} -name '*.pod' -delete
}
