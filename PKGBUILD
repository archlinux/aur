# Maintainer: George Rawlinson <george@rawlinson.net.nz>
# Contributor: Michael Straube <straubem@gmx.de>

pkgname=doomretro
pkgver=4.4.9
pkgrel=1
pkgdesc='The classic, refined DOOM source port'
arch=('x86_64' 'aarch64')
url='http://doomretro.com'
license=('GPL3')
depends=('sdl2_image' 'sdl2_mixer' 'glibc')
makedepends=('git' 'cmake')
optdepends=('timidity++: for music playback')
_commit='ec9cf4d06087683c527f6b1f3cd9a6546a1dfdf3' # v4.4.9
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
