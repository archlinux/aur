# Maintainer: Vo1dTear <vo1dtear.01@gmail.com>

pkgname=fooyin-plugin-msuinput-git
pkgver=0.1.1.r5.gd73b6d2
pkgrel=1
pkgdesc="Fooyin input plugin for MSU-1 PCM audio playback"
url="https://github.com/Vo1dTear/fooyin-plugin-msuinput"
arch=('x86_64')
license=('GPL-3.0-only')
depends=('fooyin')
makedepends=('cmake' 'git' 'ninja')
source=(
  "$pkgname"::"git+https://github.com/Vo1dTear/fooyin-plugin-msuinput.git"
)
sha256sums=('SKIP')

pkgver() {
  cd "$pkgname"
  git describe --long --tags --abbrev=7 --exclude='*[a-zA-Z][a-zA-Z]*' \
    | sed -E 's/^[^0-9]*//;s/([^-]*-g)/r\1/;s/-/./g'
}

build() {
  cmake -B build -S "$pkgname" -G Ninja \
    -DCMAKE_BUILD_TYPE=None \
    -Wno-dev
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
