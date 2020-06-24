# Maintainer: Brian Bidulock <bidulock@openss7.org>

pkgname=perl-gtk2-traymanager
_cpanname=Gtk2-TrayManager
pkgver=0.05
pkgrel=10
pkgdesc="CPAN/Gtk2::TrayManger -- perl bindings for EggTrayManager"
arch=(x86_64 i686)
url="https://metacpan.org/module/Gtk2::TrayManager"
license=('GPL')
depends=('gtk2-perl')
makedepends=('perl-extutils-depends' 'perl-extutils-pkgconfig' 'python')
options=('!emptydirs')
source=("http://cpan.metacpan.org/authors/id/B/BO/BORUP/$_cpanname-$pkgver.tar.gz")
sha512sums=('1f5e70f86f6c46aede939ed1c2412afbc3abb96176c13a953fdaad8110d9a0403d18f27eebe57eeb7d9d9d25c5ddeb7c74f5be9d89ee51a6a156eb9010025f48')

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
