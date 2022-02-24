# Maintainer: George Rawlinson <george@rawlinson.net.nz>
# Contributor: Michael Straube <straubem@gmx.de>

pkgname=doomretro
pkgver=4.4.6
pkgrel=1
pkgdesc='The classic, refined DOOM source port'
arch=('x86_64' 'aarch64')
url='http://doomretro.com'
license=('GPL3')
depends=('sdl2_image' 'sdl2_mixer' 'glibc')
makedepends=('git' 'cmake')
optdepends=('timidity++: for music playback')
_commit='aec56d2253bc77e45cc98c8fb783f13bbf7355c3' # v4.4.6
source=("$pkgname::git+https://github.com/bradharding/doomretro.git#commit=$_commit")
b2sums=('SKIP')

pkgver() {
  cd "$pkgname"

  git describe --tags | sed 's/^v//'
}

build() {
  cmake \
    -B build \
    -S "$pkgname" \
    -DCMAKE_INSTALL_PREFIX=/usr

  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
