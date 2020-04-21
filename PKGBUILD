# Maintainer: Teteros <teteros at teknik dot io>

_forkname=veal
_commit=f889b76ff8d288df6f2ea4c9e315632b63831039
pkgname=calf-ladspa
pkgver=0.90.1.0
pkgrel=1
pkgdesc="JACK audio plug-ins for musicians (LADSPA version)"
arch=(i686 x86_64)
url="https://github.com/LMMS/veal"
license=(LGPL2.1)
groups=(ladspa-plugins pro-audio)
depends=(ladspa)
makedepends=(cmake)
conflicts=(lmms)
source=("https://github.com/LMMS/$_forkname/archive/$_commit.tar.gz"
        "https://raw.githubusercontent.com/LMMS/lmms/aa0ce7fc545bbf2f63cb4df8853c1de474faba0d/plugins/LadspaEffect/calf/CMakeLists.txt"
        "https://raw.githubusercontent.com/LMMS/lmms/ae0dd21df30fb42a2194e2752d1c00ea0d2afdb9/plugins/LadspaEffect/calf/config.h.in")
noextract=("$_commit.tar.gz")
sha256sums=('38280b04d18a58ef105c6cc1570f544c3c9d22cbf9a7d692a8725268bccb48f3'
            'e9f94704e2cfbdca02e729aebcf5da9e65a9ebbead5434b69a29872a9ffdb63c'
            '8cd19eb7f19ecdbcbe3b82f91e703981f0c36d348d6a150f640ab2162d8cbad4')

prepare(){
  mkdir "$_forkname"
  bsdtar -xf "$_commit.tar.gz" --strip-components=1 -C "$_forkname"
}

build() {
  cmake -S "$_forkname" -B build -Wno-dev -DCMAKE_BUILD_TYPE=Release --build .
}

package() {
  make DESTDIR="$pkgdir/usr/lib" -C build install
}
