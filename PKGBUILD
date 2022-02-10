# Maintainer:
# Contributor: Solomon Choina <shlomochoina@gmail.com>

pkgname=libutp
pkgver=r165.059c944
pkgrel=1
_commit=059c9449a104e440e4f913756a5f560dd4ae76a9
pkgdesc='uTorrent Transport Protocol library'
url='https://github.com/bittorrent/libutp'
makedepends=(git cmake)
depends=()
arch=(x86_64)
license=('custom:Public Domain')
source=(git+https://github.com/transmission/libutp.git#commit=$_commit)
sha256sums=('SKIP')

pkgver(){
 cd libutp
 printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cmake -B build -S libutp \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DLIBUTP_BUILD_PROGRAMS=OFF \
    -DCMAKE_CXX_FLAGS="$CXXFLAGS -ffat-lto-objects"
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
  install -Dm644 libutp/LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname
}
