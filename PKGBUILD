# Maintainer: Martin Müllenhaupt <mm+aur.archlinux.org@netlair.de>
pkgname=faf-ice-adapter
pkgver=6.3.3
pkgrel=1
epoch=0
pkgdesc="A P2P connection proxy for Supreme Commander: Forged Alliance using ICE"
url="http://www.faforever.com/"
arch=('x86_64')
license=('GPL3')
groups=()
depends=('libc++')
makedepends=('git' 'ninja' 'cmake' 'clang' 'libc++')
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("git+https://github.com/FAForever/ice-adapter.git" "https://github.com/FAForever/libwebrtc/releases/download/68-faf-1/libwebrtc-68-faf-1-linux-x64.tar.gz")
sha256sums=('SKIP' '6407a3fe87d68d8f0f62f7405de219218ecdf4cf0f3a9cd724dd261b6055d686')
noextract=()
validpgpkeys=()

pkgver() {
  cd "ice-adapter"
  git describe --tags --abbrev=0 | cut -d v -f 2 | sed 's/-/./g'
}

build() {
  tar xf "libwebrtc-68-faf-1-linux-x64.tar.gz"
  cd "ice-adapter"
  cmake -G Ninja -DCMAKE_CXX_COMPILER="/usr/bin/clang++" -DWEBRTC_INCLUDE_DIRS="../include" -DWEBRTC_LIBRARIES="../lib/libwebrtc.a" -DCMAKE_BUILD_TYPE=Release .
  ninja
}

package() {
  install -D -s "./ice-adapter/faf-ice-adapter" "$pkgdir/usr/bin/faf-ice-adapter"
}
