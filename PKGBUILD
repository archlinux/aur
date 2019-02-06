# Maintainer: Teteros <teteros at teknik dot io>

_forkname=veal
pkgname=calf-ladspa
pkgver=0.90
pkgrel=2
pkgdesc="JACK audio plug-ins for musicians (LADSPA lmms fork)"
arch=('i686' 'x86_64')
url="https://github.com/LMMS/veal"
license=('LGPL')
groups=('ladspa-plugins')
makedepends=('ladspa' 'cmake')
conflicts=('lmms')
source=("https://github.com/LMMS/$_forkname/archive/ladspa.zip"
        "https://raw.githubusercontent.com/LMMS/lmms/master/plugins/LadspaEffect/calf/CMakeLists.txt"
        "https://raw.githubusercontent.com/LMMS/lmms/master/plugins/LadspaEffect/calf/config.h.in")
noextract=('ladspa.zip')
sha256sums=('SKIP' 'SKIP' 'SKIP')

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
