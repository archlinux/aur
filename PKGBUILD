# Maintainer: Vaporeon <vaporeon@vaporeon.io>
pkgname=invader
pkgver=0.55.0
_commit=33518109f2d7d1694a41b4ea7e957d244eb1866f
pkgrel=1
pkgdesc="An open source toolkit for creating maps and assets for Halo: Combat Evolved"
depends=('libtiff' 'libarchive' 'libsquish' 'flac' 'freetype2' 'libsamplerate'
         'libogg' 'libvorbis' 'qt6-base' 'sdl2' 'zlib' 'gcc-libs' 'glibc')
makedepends=('cmake' 'corrosion' 'git' 'ninja' 'python' 'rust')
arch=('x86_64')
url="https://invader.opencarnage.net"
license=('GPL-3.0-only')
source=("git+https://github.com/SnowyMouse/${pkgname}.git#commit=$_commit"
        "git+https://github.com/SnowyMouse/riat.git")
sha256sums=('SKIP'
            'SKIP')

prepare() {
  cd invader
  git submodule init
  git config submodule.riat.url "${srcdir}/riat"
  git submodule update
}

build() {
  cmake -S "$pkgname" \
    -G Ninja \
    -B build \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=Release

  cmake --build build --config Release
}

package() {
  DESTDIR="${pkgdir}" cmake --install build --config Release
}
