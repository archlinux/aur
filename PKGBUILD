# Maintainer: Brian Bidulock <bidulock@openss7.org>
# Contributor: Murtuza Akhtari <inxsible at gmail dot com>

pkgname=wumwum
pkgver=0.9
pkgrel=11
pkgdesc="The Window Manager manager. It can turn emwh compliant window managers into a tiling window manager while retaining all initial functionalities. "
arch=('i686' 'x86_64')
url="http://wumwum.sourceforge.net/"
license=('GPL3')
depends=('wmctrl' 'libaosd' 'xorg-xprop' 'xorg-xdpyinfo')
options=('!emptydirs')
source=(http://downloads.sourceforge.net/$pkgname/$pkgname-$pkgver.tgz)

md5sums=('a2bcc7c22a7f2083cbda0d5e00849cc0')

build() {
  cd $pkgname-$pkgver
  PERL_MM_USE_DEFAULT=1 perl Makefile.PL INSTALLDIRS=vendor
  make
}
package() {
  cd $pkgname-$pkgver
  make DESTDIR="$pkgdir" INSTALLVENDORSCRIPT=/usr/bin install
  find $pkgdir -name '.packlist' -delete
  find $pkgdir -name '*.pod' -delete
# template start; name=perl-binary-module-dependency; version=1;
if [[ $(find "$pkgdir/usr/lib/perl5/" -name "*.so") ]]; then
	_perlver_min=$(perl -e '$v = $^V->{version}; print $v->[0].".".($v->[1]);')
	_perlver_max=$(perl -e '$v = $^V->{version}; print $v->[0].".".($v->[1]+1);')
	depends+=("perl>=$_perlver_min" "perl<$_perlver_max")
fi
# template end;
}
