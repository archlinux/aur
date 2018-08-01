# Maintainer: Jan de Groot <jgc@archlinux.org>
# Contributor: Sarah Hay <sarah@archlinux.org>

pkgname=gtk2-perl
pkgver=1.24992
pkgrel=2
pkgdesc="Perl bindings for GTK+ 2.x"
arch=(x86_64)
license=('LGPL')
url="http://gtk2-perl.sourceforge.net/"
makedepends=('perl-extutils-pkgconfig' 'perl-extutils-depends')
depends=('gtk2' 'pango-perl')
checkdepends=('ttf-dejavu' 'xorg-server-xvfb')
options=('!emptydirs')
source=(https://downloads.sourceforge.net/sourceforge/gtk2-perl/Gtk2-${pkgver}.tar.gz)
sha256sums=('a2ed6902f7f29f7c8dddbe58119589f433252a12132c295c54afbac587cc8480')

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
