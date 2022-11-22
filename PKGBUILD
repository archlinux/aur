# Maintainer: Xinc

pkgname=nux
_actual_ver=4.0.8
_extra_ver=+18.10.20180623
pkgver=${_actual_ver}${_extra_ver/\+/.}
pkgrel=1
pkgdesc="Visual rendering toolkit for the Unity7 user interface"
arch=(x86_64)
url="https://launchpad.net/nux"
license=(GPL)
depends=(glewmx mesa libxtst libxfixes libxext libglvnd glew pango libxxf86vm libxinerama libxdamage libxcomposite libx11 gdk-pixbuf2 cairo glu geis pciutils libpng libsigc++ pcre2 boost ibus)
makedepends=(gnome-common glibc gcc glib2)
source=("https://launchpad.net/ubuntu/+archive/primary/+files/nux_${_actual_ver}${_extra_ver}.orig.tar.gz")
sha512sums=('SKIP')

prepare() {
 sed -i 's:AM_CXXFLAGS-:AM_CXXFLAGS=:' configure.ac 
}

build() {
 ./autogen.sh --prefix=/usr --libexecdir=/usr/lib/"${pkgname}" --disable-static --enable-tests=no --disable-debug --disable-examples --disable-tests
 cp ../Makefiles/data/Makefile data/Makefile
 cp ../Makefiles/gputests/Makefile gputests/Makefile
 cp ../Makefiles/Makefile Makefile
 cp ../Makefiles/NuxCore/Makefile NuxCore/Makefile
 cp ../Makefiles/tests/Makefile tests/Makefile
 cp ../Makefiles/examples/Makefile examples/Makefile
 cp ../Makefiles/libtool libtool
 cp ../Makefiles/Nux/Makefile Nux/Makefile
 cp ../Makefiles/NuxGraphics/Makefile NuxGraphics/Makefile
 cp ../Makefiles/tools/Makefile tools/Makefile
 make
}

package() {
 make DESTDIR="${pkgdir}" install
}


