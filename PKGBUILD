# Maintainer: Teteros <teteros at teknik dot io>

_forkname=veal
pkgname=calf-ladspa
pkgver=0.0.90
pkgrel=1
pkgdesc="JACK audio plug-ins for musicians (LADSPA lmms fork)"
arch=(i686 x86_64)
url="https://github.com/LMMS/veal"
license=(LGPL)
makedepends=(ladspa cmake)
source=("https://github.com/LMMS/$_forkname/archive/ladspa.zip"
        "https://raw.githubusercontent.com/LMMS/lmms/master/plugins/LadspaEffect/calf/CMakeLists.txt"
        "https://raw.githubusercontent.com/LMMS/lmms/master/plugins/LadspaEffect/calf/config.h.in")
noextract=("ladspa.zip")
sha256sums=('f422eb41409d2ef5e4bce7a2af44113cfead511b10aed0313bd1dfce595fb611'
            '1a07f90853e3999edf396c720540c3655143ec5ecdef99cb45a1af97e20f5be7'
            '8cd19eb7f19ecdbcbe3b82f91e703981f0c36d348d6a150f640ab2162d8cbad4')

prepare(){
  mkdir -p "$_forkname/build"
  bsdtar -xf ladspa.zip --strip-components=1 -C "$_forkname"
}

build() {
  cd "$srcdir/$_forkname/build"
  cmake -Wno-dev "$srcdir"
  make
}

package() {
  cd "$srcdir/$_forkname/build"
  make DESTDIR="$pkgdir/usr/lib" install
}

# vim:set sw=2 ts=2 indentexpr=GetShIndent() et:
