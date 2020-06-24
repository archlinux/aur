# Maintainer: Brian Bidulock <bidulock@openss7.org>

pkgname=perl-sys-gamin
_cpanname=Sys-Gamin
_module=Sys::Gamin
pkgver=0.1
pkgrel=12
pkgdesc="$_module - Perl interface to Gamin (File Access Monitor implementation)"
arch=('i686' 'x86_64')
url="https://metacpan.org/release/$_cpanname"
license=('LGPL' 'PerlArtistic')
depends=('perl' 'gamin')
options=('!emptydirs')
source=("http://cpan.metacpan.org/authors/id/G/GA/GARNACHO/${_cpanname}-${pkgver}.tar.gz")
md5sums=('4eb05138c28e8a5f12340938b0823a4c')

build() {
  cd $_cpanname-$pkgver
  PERL_MM_USE_DEFAULT=1 perl Makefile.PL INSTALLDIRS=vendor
  make
}

check() {
  cd $_cpanname-$pkgver
#  make test
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
  cd $_cpanname-$pkgver
  make PERL_MM_USE_DEFAULT=1 DESTDIR="$pkgdir" install
  find "$pkgdir" -name '.packlist' -o -name '*.pod' -delete
  _perl_depends
}

# vim:set ts=2 sw=2 et:
