# Maintainer: Jan de Groot <jgc@archlinux.org>
# Contributor: Sarah Hay <sarah@archlinux.org>

pkgname=gtk2-perl
pkgver=1.244
pkgrel=1
pkgdesc="Perl bindings for GTK+ 2.x"
arch=(i686 x86_64)
license=('LGPL')
url="http://gtk2-perl.sourceforge.net/"
makedepends=('perl-extutils-pkgconfig' 'perl-extutils-depends')
depends=('gtk2' 'pango-perl')
checkdepends=('ttf-dejavu' 'xorg-server-xvfb')
options=('!emptydirs')
source=(http://downloads.sourceforge.net/sourceforge/gtk2-perl/Gtk2-${pkgver}.tar.gz)
md5sums=('191fda807f44a7c82d699838bf544bca')

build() {
  cd "${srcdir}/Gtk2-${pkgver}"
  PERL_MM_USE_DEFAULT=1 perl Makefile.PL INSTALLDIRS=vendor
  make
}

check() {
  cd "${srcdir}/Gtk2-${pkgver}"
  LD_PRELOAD="" Xvfb -nolisten tcp -extension GLX -screen 0 1280x1024x24 :99 &
  LD_PRELOAD="" DISPLAY=:99 make test
  kill $!
}

package() {
  cd "${srcdir}/Gtk2-${pkgver}"
  make install DESTDIR="${pkgdir}"
}
