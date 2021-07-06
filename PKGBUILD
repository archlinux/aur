# Maintainer: Teteros <teteros at teknik dot io>

_forkname=veal
_commit=f889b76ff8d288df6f2ea4c9e315632b63831039
pkgname=calf-ladspa
pkgver=0.90.1.0
pkgrel=3
pkgdesc="JACK audio plug-ins for musicians (LADSPA version)"
arch=(i686 x86_64)
url="https://github.com/LMMS/veal"
license=(LGPL2.1)
groups=(ladspa-plugins pro-audio)
makedepends=(cmake ladspa)
conflicts=(lmms)
source=("https://github.com/LMMS/$_forkname/archive/$_commit.tar.gz"
        "https://raw.githubusercontent.com/LMMS/lmms/7e986a83230b5f52a4cd3a917c99d69ac96f007a/plugins/LadspaEffect/calf/CMakeLists.txt"
        "https://raw.githubusercontent.com/LMMS/lmms/ae0dd21df30fb42a2194e2752d1c00ea0d2afdb9/plugins/LadspaEffect/calf/config.h.in")
noextract=("$_commit.tar.gz")
sha256sums=('SKIP' 'SKIP' 'SKIP')

prepare(){
  mkdir "$_forkname"
  bsdtar -xf "$_commit.tar.gz" --strip-components=1 -C "$_forkname"
}

build() {
  cmake . -B build -Wno-dev -DCMAKE_BUILD_TYPE=Release
  cmake --build build
}

package() {
  make DESTDIR="$pkgdir/usr/lib" -C build install
}
