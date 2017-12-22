# Maintainer: Martin Müllenhaupt <mm+aur.archlinux.org@netlair.de>
pkgname=faf-ice-adapter
pkgver=6.1.3
pkgrel=1
epoch=0
pkgdesc="A P2P connection proxy for Supreme Commander: Forged Alliance using ICE"
url="http://www.faforever.com/"
arch=('x86_64')
license=('GPL3')
groups=()
depends=('libc++')
makedepends=('git' 'ninja' 'cmake' 'gcc' 'libwebrtc-static>=1.0.0.faf4-1' 'clang')
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("git+https://github.com/FAForever/ice-adapter.git")
sha256sums=('SKIP')
noextract=()
validpgpkeys=()

pkgver() {
  cd "ice-adapter"
  git describe --tags --abbrev=0 | cut -d v -f 2 | sed 's/-/./g'
}

build() {
  cd "ice-adapter"
  cmake -G Ninja -DCMAKE_CXX_COMPILER="/usr/bin/clang++" -DCMAKE_CXX_FLAGS="-stdlib=libc++" -DWEBRTC_LIBRARIES="/usr/lib/libwebrtc.a" -DCMAKE_BUILD_TYPE=Release .
  ninja
}

package() {
  install -D -s "./ice-adapter/faf-ice-adapter" "$pkgdir/usr/bin/faf-ice-adapter"
}
