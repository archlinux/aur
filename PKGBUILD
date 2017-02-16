# Maintainer: Joan Figueras <ffigue at gmail dot com>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Alessio 'mOLOk' Bolognino <themolok@gmail.com>

pkgname=perl-gnome2-gconf
pkgver=1.044
pkgrel=2
pkgdesc="Perl interface to the GConf configuration database"
arch=('i686' 'x86_64')
license=("GPL" "PerlArtistic")
url="http://search.cpan.org/dist/Gnome2-GConf"
depends=('gtk2-perl' 'gconf' 'glib-perl' 'perl>=5.24' 'perl<5.25')
#makedepends=('perl-extutils-depends' 'perl-extutils-pkgconfig')
options=('!emptydirs')
provides=("gconf-perl")
source=("http://search.cpan.org/CPAN/authors/id/T/TS/TSCH/Gnome2-GConf-${pkgver}.tar.gz")
sha256sums=('875cb87bff28340c15c9bda9b645b5af8002d9b471363d5475532bc1d34e1df2')

build() {
  cd Gnome2-GConf-${pkgver}
  PERL_MM_USE_DEFAULT=1 perl Makefile.PL INSTALLDIRS=vendor
  make
}

package() {
  cd Gnome2-GConf-${pkgver}
  make install DESTDIR="$pkgdir"
# template start; name=perl-binary-module-dependency; version=1;
if [[ $(find "$pkgdir/usr/lib/perl5/" -name "*.so") ]]; then
	_perlver_min=$(perl -e '$v = $^V->{version}; print $v->[0].".".($v->[1]);')
	_perlver_max=$(perl -e '$v = $^V->{version}; print $v->[0].".".($v->[1]+1);')
	depends+=("perl>=$_perlver_min" "perl<$_perlver_max")
fi
# template end;
}
