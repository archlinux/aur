# Maintainer: David Baum <david.baum@naraesk.eu>
pkgname=titania-git
pkgver=5157
pkgrel=2
pkgdesc="Use Titania to create standard complient X3D/VRML worlds for publishing on the World Wide Web and for creating stand alone applications"
arch=('i686' 'x86_64')
url="http://titania.create3000.de"
license=('GPL3')
groups=()
depends=('gtkmm3' 'gtksourceviewmm' 'glu' 'glew' 'mesa' 'libgl' 'js185' 'fontconfig' 'imagemagick' 'curl' 'openssl' 'sqlite' 'gstreamermm' 'zlib' 'libgtop' 'gettext' 'perl' 'perl-xml-libxml' 'glib-perl' 'perl-switch' 'cgal' 'gmp' 'mpfr' 'ttf-ubuntu-font-family' 'libxml++2.6')
makedepends=('make' 'gstreamer' 'gst-plugins-base' 'intltool' 'libtool')
optdepends=()
provides=()
conflicts=('')
replaces=()
backup=()
options=()
install=()
changelog=()
source=('git+https://github.com/create3000/titania.git'
	'IM7.patch'
	'fix_min.patch')
noextract=()
md5sums=('SKIP'
         'SKIP'
         'SKIP')

pkgver() {
    cd titania
    git rev-list --count HEAD
}

prepare() {
    cd titania
    patch -p1 -i "${srcdir}/IM7.patch"
    patch -p1 -i "${srcdir}/fix_min.patch"
}

build() {
  cd titania
  ./autogen.sh
  ./configure --prefix=/usr
  make
}

package() {
  cd titania
  make run
  echo $pkgdir
  make DESTDIR="$pkgdir/" install
}
