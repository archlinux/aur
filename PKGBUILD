# Maintainer: Brian Bidulock <bidulock@openss7.org>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Tom K <tomk@runbox.com>

_cpanname=Gtk2-TrayIcon
pkgname=perl-gtk2-trayicon
pkgver=0.07
pkgrel=1.5
pkgdesc="Perl interface to the EggTrayIcon library"
arch=('x86_64' 'i686')
url="https://search.cpan.org/dist/${_cpanname}/"
depends=('gtk2-perl')
makedepends=('perl-extutils-pkgconfig' 'perl-extutils-depends')
license=("GPL")
options=('!emptydirs')
#source=("https://downloads.sourceforge.net/sourceforge/gtk2-perl/Gtk2-TrayIcon-${pkgver}.tar.gz")
source=("https://cpan.metacpan.org/authors/id/X/XA/XAOC/${_cpanname}-${pkgver}.tar.gz")
md5sums=('c3db5edd7c39ca52625d664b0fb988a5')

build() {
  cd  ${_cpanname}-${pkgver}
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
  cd  ${_cpanname}-${pkgver}
  make install DESTDIR="$pkgdir"
  find "$pkgdir" -name '.packlist' -delete
  find "$pkgdir" -name '*.pod' -delete
  _perl_depends
}
