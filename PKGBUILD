# Maintainer: Giovanni Scafora <giovanni@archlinux.org>
# Contributor: François Charette <firmicus ατ gmx δοτ net>

pkgname=perl-crypt-ssleay
pkgver=0.72
pkgrel=2
pkgdesc="OpenSSL glue that provides LWP https support"
arch=('i686' 'x86_64')
url="http://search.cpan.org/dist/Crypt-SSLeay"
license=('GPL' 'PerlArtistic')
depends=('perl-lwp-protocol-https' 'perl-try-tiny' 'perl-path-class')
options=('!emptydirs')
source=(http://www.cpan.org/CPAN/authors/id/N/NA/NANIS/Crypt-SSLeay-$pkgver.tar.gz) 
md5sums=('77d955c9056dbb12413d95d8852a9cdf')

build() {
  cd  "${srcdir}/Crypt-SSLeay-${pkgver}"

  PERL_MM_USE_DEFAULT=1 perl Makefile.PL INSTALLDIRS=vendor
  make
}

check() {
  cd  "${srcdir}/Crypt-SSLeay-${pkgver}"

  make test
}

package() {
  cd  "${srcdir}/Crypt-SSLeay-${pkgver}"

  make install DESTDIR="${pkgdir}"

  find ${pkgdir} -name '.packlist' -delete
  find ${pkgdir} -name '*.pod' -delete
}
