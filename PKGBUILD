# Maintainer: William J. Bowman <aur@williamjbowman.com>
# Contributor: Justin Davis <jrcd83 at gmail>
# Generator  : CPANPLUS::Dist::Arch 0.14
pkgname='perl-class-trigger'
_cpanname='Class-Trigger'
pkgver='0.14'
pkgrel='6'
pkgdesc="Mixin to add / call inheritable triggers"
arch=('i686' 'x86_64')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl>=0' 'perl-io-stringy')
makedepends=('perl-module-install')
url="http://search.cpan.org/dist/Class-Trigger"
source=("http://search.cpan.org/CPAN/authors/id/M/MI/MIYAGAWA/${_cpanname}-${pkgver}.tar.gz")
md5sums=('b0a95ebe359a3c4e768d81fc58031c83')
sha256sums=('6b1e45acc561e0708e00a2fcf16e157cad8b8963d1bf73726f77dd809b8aebc4')
sha512sums=('f0908469a4853ef386158f2ee66bb52a1bb4cfcdb385ecd9fd3375af87943910ba75f99066a00eab5dd367f68404369c8ad4ae2afbcb76d18e9f1327f95eb2ca')

build() {

  cd ${_cpanname}-${pkgver}
  PERL_MM_USE_DEFAULT=1 perl Makefile.PL INSTALLDIRS=vendor
  make
}

test() {
  cd ${_cpanname}-${pkgver}
  make PERL_MM_USE_DEFAULT=1 test
}

_perl_depends() {
# template start; name=perl-binary-module-dependency; version=1;
if [[ $(find "$pkgdir/usr/lib/perl5/" -name "*.so") ]]; then
	_perlver_min=$(perl -e '$v = $^V->{version}; print $v->[0].".".($v->[1]);')
	_perlver_max=$(perl -e '$v = $^V->{version}; print $v->[0].".".($v->[1]+1);')
	depends+=("perl>=$_perlver_min" "perl<$_perlver_max")
fi
# template end;
}

package() {
  cd ${_cpanname}-${pkgver}
  make DESTDIR="${pkgdir}/" PERL_MM_USE_DEFAULT=1 install;

  find "$pkgdir" -name .packlist -delete
  find "$pkgdir" -name perllocal.pod -delete
  _perl_depends
}
