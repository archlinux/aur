# Maintainer: Brian Bidulock <bidulock@openss7.org>

pkgname=perl-gtk2-traymanager
_cpanname=Gtk2-TrayManager
pkgver=0.05
pkgrel=8
pkgdesc="CPAN/Gtk2::TrayManger -- perl bindings for EggTrayManager"
arch=(x86_64 i686)
url="https://metacpan.org/module/Gtk2::TrayManager"
license=('GPL')
depends=('gtk2-perl')
makedepends=('perl-extutils-depends' 'perl-extutils-pkgconfig' 'python')
options=('!emptydirs')
source=("http://cpan.metacpan.org/authors/id/B/BO/BORUP/$_cpanname-$pkgver.tar.gz")
md5sums=('88cf41ab0d72572ac3d2e9ab9b3ab8f0')

build() {
  cd "$srcdir/$_cpanname-$pkgver"
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
  cd "$srcdir/$_cpanname-$pkgver"
  make DESTDIR="$pkgdir" install
  find "$pkgdir" -name '.packlist' -delete
  find "$pkgdir" -name '*.pod' -delete
  _perl_depends
}
