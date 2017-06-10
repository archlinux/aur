# Maintainer: Gerardo Exequiel Pozzi <vmlinuz386@yahoo.com.ar>

pkgname=perl-linux-smaps
_pkgname=Linux-Smaps
pkgver=0.13
pkgrel=3
pkgdesc='Linux::Smaps - a Perl interface to /proc/PID/smaps'
arch=('i686' 'x86_64')
license=('GPL' 'PerlArtistic')
url="http://search.cpan.org/dist/${_pkgname}/"
depends=('perl' 'perl-class-member')
changelog="ChangeLog"
options=(!emptydirs)
source=(http://search.cpan.org/CPAN/authors/id/O/OP/OPI/${_pkgname}-$pkgver.tar.gz)
md5sums=('28bbe178b1b26935c454fa8ccdd16929')

build() {
  cd $_pkgname-$pkgver
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
  cd $_pkgname-$pkgver
  make PERL_MM_USE_DEFAULT=1 DESTDIR="$pkgdir" install
  _perl_depends
}
