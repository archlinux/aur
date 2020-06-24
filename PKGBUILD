# CPAN Name  : Net-RawIP
# Contributor: Anonymous

pkgname=perl-net-rawip
_cpanname='Net-RawIP'
pkgver=0.25
pkgrel=14
pkgdesc="Perl extension to manipulate raw IP packets with interface to B<libpcap>"
arch=('i686' 'x86_64')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('libpcap>=1.3.0' 'perl')
makedepends=()
url='http://search.cpan.org/dist/Net-RawIP'
source=("http://search.cpan.org/CPAN/authors/id/S/SA/SAPER/${_cpanname}-${pkgver}.tar.gz")
sha512sums=('c48c77389db9dc8d5c64d67e5c62bac5e3314dbc36bcfa51aa20d07224492edaa65f5c71d47ca0b804ac62b1b02387e172cd3561eadaa3a1a8040968b182b3ca')

build() {
  cd ${_cpanname}-${pkgver}
  PERL_MM_USE_DEFAULT=1 perl Makefile.PL INSTALLDIRS=vendor
  make
}

check() {
  cd ${_cpanname}-${pkgver}
  PERL_MM_USE_DEFAULT=1
  make test
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
  make install DESTDIR="$pkgdir"
  find "$pkgdir" -name '.packlist' -o -name '*.pod' -delete
  _perl_depends
}
