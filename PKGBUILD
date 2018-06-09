# Maintainer: Martin Müllenhaupt <mm+aur.archlinux.org@netlair.de>
pkgname=faf-ice-adapter
pkgver=6.2.4
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
source=("git+https://github.com/FAForever/ice-adapter.git" "https://github.com/FAForever/libwebrtc/releases/download/v1.0.0-faf5/libwebrtc-1.0.0-faf5-linux-x64.tar.gz")
sha256sums=('SKIP' '322e3ee7cd2769ccde8a345b7932807181d4007261d6bfcb3ca76a2cc2c79520')
noextract=()
validpgpkeys=()

pkgver() {
  cd "ice-adapter"
  git describe --tags --abbrev=0 | cut -d v -f 2 | sed 's/-/./g'
}

build() {
  tar xf "libwebrtc-1.0.0-faf5-linux-x64.tar.gz"
  cd "ice-adapter"
  cmake -G Ninja -DCMAKE_CXX_COMPILER="/usr/bin/clang++" -DWEBRTC_INCLUDE_DIRS="../include" -DWEBRTC_LIBRARIES="../lib/libwebrtc.a" -DCMAKE_BUILD_TYPE=Release .
  ninja
}

package() {
  install -D -s "./ice-adapter/faf-ice-adapter" "$pkgdir/usr/bin/faf-ice-adapter"
}
