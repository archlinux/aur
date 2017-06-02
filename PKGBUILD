# Maintainer: Giovanni Scafora <giovanni@archlinux.org>
# Contributor: François Charette <firmicus ατ gmx δοτ net>

pkgname=perl-crypt-ssleay
pkgver=0.73_04
pkgrel=5
pkgdesc="OpenSSL glue that provides LWP https support"
arch=('i686' 'x86_64')
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

# template start; name=perl-binary-module-dependency; version=1;
if [[ $(find "$pkgdir/usr/lib/perl5/" -name "*.so") ]]; then
	_perlver_min=$(perl -e '$v = $^V->{version}; print $v->[0].".".($v->[1]);')
	_perlver_max=$(perl -e '$v = $^V->{version}; print $v->[0].".".($v->[1]+1);')
	depends+=("perl>=$_perlver_min" "perl<$_perlver_max")
fi
# template end;
}
