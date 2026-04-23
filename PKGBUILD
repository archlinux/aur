# Maintainer: Christopher Snowhill <kode54@gmail.com>
pkgname=libspessasynth-git
_pkgname=${pkgname%-git}
pkgver=r227.b593cae
pkgrel=1
pkgdesc="A powerful SoundFont and DLS MIDI synthesizer"
url="https://github.com/kode54/spessasynth_core_c"
arch=('x86_64')
license=('Apache-2.0')
makedepends=('cmake' 'git')
depends=('libvorbis' 'flac')
source=("$_pkgname::git+https://github.com/kode54/spessasynth_core_c.git")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"
  echo r$(git rev-list --count main).$(git rev-parse --short main)
}

build() {
  local cmake_options=(
    -B build
    -S $_pkgname/spessasynth_core
    -D CMAKE_INSTALL_PREFIX=/usr
  )
  cmake "${cmake_options[@]}"
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
