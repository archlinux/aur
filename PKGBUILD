# Maintainer: David Baum <david.baum@naraesk.eu>
pkgname=titania
pkgver=4.3.3
pkgrel=1
pkgdesc="Use Titania to create standard complient X3D/VRML worlds for publishing on the World Wide Web and for creating stand alone applications"
arch=('i686' 'x86_64')
url="http://titania.create3000.de"
license=('GPL3')
groups=()
depends=('gtkmm3' 'gtksourceviewmm' 'glu' 'glew' 'mesa' 'mesa-libgl' 'js185' 'fontconfig' 'imagemagick' 'curl' 'openssl' 'sqlite' 'gstreamermm' 'zlib' 'libgtop' 'gettext' 'perl' 'perl-xml-libxml' 'glib-perl' 'perl-switch' 'cgal' 'gmp' 'mpfr' 'ttf-ubuntu-font-family' 'libxml++2.6' 'bullet')
makedepends=('make' 'gstreamer' 'gst-plugins-base' 'intltool' 'libtool' 'boost')
optdepends=()
provides=()
conflicts=('')
replaces=()
backup=()
options=()
install=()
changelog=()
source=('https://github.com/create3000/titania/archive/4.3.3.tar.gz'
        'IM7.patch'
	'fix_min.patch')
noextract=()
md5sums=('ac7c71c462168493601e9c4141fea65a'
         '05690a0a63e32bba5f7aedbd072fe8cd'
         '0618c83f0b4ea1500b81dc78eded6ffd')

prepare() {
  cd ${pkgname}-${pkgver}
  patch -p1 -i "${srcdir}/IM7.patch"
  patch -p1 -i "${srcdir}/fix_min.patch"
  mkdir -p build
}

build() {
  cd ${pkgname}-${pkgver}/build
  ../autogen.sh
  ../configure --prefix=/usr
  make
}

package() {
  cd ${pkgname}-${pkgver}/build
  make DESTDIR="$pkgdir/" run
}
