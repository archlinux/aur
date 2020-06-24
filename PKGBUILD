# Maintainer: Brian Bidulock <bidulock@openss7.org>
pkgname=perl-spread-client-constant
_realname=Spread-Client-Constant
pkgver=0.02
pkgrel=12
pkgdesc="CPAN/Spread::Client::Constant - Spread::Client constants"
arch=('i686' 'x86_64')
url="https://metacpan.org/module/Spread::Client::Constant"
license=('Perl')
depends=('perl' 'perl-spread')
options=('!emptydirs')
source=("http://cpan.metacpan.org/authors/id/M/MB/MBAILEY/$_realname-$pkgver.tar.gz")
md5sums=('ac6e3358fcddffa0382647422d490c6e')

build() {
  cd  $_realname-$pkgver
  PERL_MM_USE_DEFAULT=1 perl Makefile.PL INSTALLDIRS=vendor
  make
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
  cd  $_realname-$pkgver
  make PERL_MM_USE_DEFAULT=1 DESTDIR="$pkgdir" install
  find $pkgdir -name '.packlist' -delete
  find $pkgdir -name '*.pod' -delete
  _perl_depends
}
