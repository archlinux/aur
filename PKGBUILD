# $Id$
# Maintainer: PhotonX <photon89@googlemail.com>
# Contributor: Jan de Groot <jgc@archlinux.org>

pkgname=gnome-perl
pkgver=1.045
pkgrel=6
pkgdesc="Perl bindings for libgnome"
arch=('i686' 'x86_64')
license=('LGPL')
url="http://gtk2-perl.sourceforge.net/"
makedepends=('perl-extutils-pkgconfig' 'perl-extutils-depends')
depends=('gnomecanvas-perl' 'gnome-vfs-perl' 'libgnomeui' 'perl')
options=('!emptydirs')
source=(http://downloads.sourceforge.net/sourceforge/gtk2-perl/Gnome2-${pkgver}.tar.gz)
md5sums=('95c06139f9d950df17c9cb0340c74168')

build() {
  cd Gnome2-$pkgver
  perl Makefile.PL INSTALLDIRS=vendor
  make
}

package() {
  cd Gnome2-$pkgver
  make DESTDIR="${pkgdir}" install

# template start; name=perl-binary-module-dependency; version=1;
if [[ $(find "$pkgdir/usr/lib/perl5/" -name "*.so") ]]; then
	_perlver_min=$(perl -e '$v = $^V->{version}; print $v->[0].".".($v->[1]);')
	_perlver_max=$(perl -e '$v = $^V->{version}; print $v->[0].".".($v->[1]+1);')
	depends+=("perl>=$_perlver_min" "perl<$_perlver_max")
fi
# template end;
}
