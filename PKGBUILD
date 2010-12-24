# Maintainer: Giovanni Scafora <giovanni@archlinux.org>
# Contributor: François Charette <firmicus ατ gmx δοτ net>

pkgname=perl-crypt-ssleay
pkgver=0.58
pkgrel=2
pkgdesc="OpenSSL glue that provides LWP https support"
arch=('i686' 'x86_64')
url="http://search.cpan.org/dist/Crypt-SSLeay"
license=('GPL' 'PerlArtistic')
depends=('openssl')
options=('!emptydirs')
source=(http://www.cpan.org/CPAN/authors/id/N/NA/NANIS/Crypt-SSLeay-$pkgver.tar.gz) 
md5sums=('fbf3d12e58462cee00ea63239c0b13c7')

build() {
  cd  "${srcdir}/Crypt-SSLeay-${pkgver}"

  PERL_MM_USE_DEFAULT=1 perl Makefile.PL INSTALLDIRS=vendor
  make
  make test
}

package() {
  cd  "${srcdir}/Crypt-SSLeay-${pkgver}"
  make install DESTDIR="${pkgdir}"

  find ${pkgdir} -name '.packlist' -delete
  find ${pkgdir} -name '*.pod' -delete
}
