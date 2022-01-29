# Maintainer: George Rawlinson <george@rawlinson.net.nz>
# Contributor: Michael Straube <straubem@gmx.de>

pkgname=doomretro
pkgver=4.4.3
pkgrel=1
pkgdesc='The classic, refined DOOM source port'
arch=('x86_64' 'aarch64')
url='http://doomretro.com'
license=('GPL3')
depends=('sdl2_image' 'sdl2_mixer' 'glibc')
makedepends=('cmake')
optdepends=('timidity++: for music playback')
source=("$pkgname-$pkgver.tar.gz::https://github.com/bradharding/doomretro/archive/v$pkgver.tar.gz")
sha512sums=('120b180ca9f8d52aa696d06da659cd7e5342362b2b4c47c21b7b3e6d9635f24bf9e063bfcbf901f58f604029348f1b943277508be325171b78505e85dee459bf')
b2sums=('1ce83bc41db4f659c56fa8fd9531fad5133ba26474397c61045acb9768018f50ab2b85d440685ad678804ce6165b43837358931a7a7a3541ee1b239229d5625e')

build() {
  cmake \
    -B build \
    -S "$pkgname-$pkgver" \
    -DCMAKE_INSTALL_PREFIX=/usr
  make -C build

  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
