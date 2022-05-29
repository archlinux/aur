# Maintainer: Jan de Groot <jgc@archlinux.org>
# Contributor: Sarah Hay <sarah@archlinux.org>

pkgname=gtk2-perl
pkgver=1.24993
pkgrel=4
pkgdesc="Perl bindings for GTK+ 2.x"
arch=(x86_64)
license=('LGPL')
url="http://gtk2-perl.sourceforge.net/"
makedepends=('perl-extutils-pkgconfig' 'perl-extutils-depends')
depends=('gtk2' 'pango-perl')
checkdepends=('ttf-dejavu' 'xorg-server-xvfb')
options=('!emptydirs')
source=(https://downloads.sourceforge.net/sourceforge/gtk2-perl/Gtk2-${pkgver}.tar.gz)
sha512sums=('320b10803394b196e0833ab998b854c7e184d6f291657c732a1fddb0c049d01ef192c73e6a095a87b18ff8cb9ac846fcb3682a2dd0c9c86076342e3ca7e55eb5')

prepare() {
  cd Gtk2-$pkgver
  # Disable failing test. Doesn't work for several versions, might be related to Xvfb too
  #sed -e 's/gnome-foot.png/gnome-foot2.png/' -i t/GdkPixbufLoader.t
}

build() {
  cd Gtk2-$pkgver
  export PERL_USE_UNSAFE_INC=1
  PERL_MM_USE_DEFAULT=1 perl Makefile.PL INSTALLDIRS=vendor
  make
}

#check() {
#  cd Gtk2-$pkgver
#  xvfb-run -a -s "-extension GLX -screen 0 1280x1024x24" make test
#}

package() {
  cd Gtk2-$pkgver
  make install DESTDIR="${pkgdir}"
}
