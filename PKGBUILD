# Maintainer: Anatol Pomozov <anatol.pomozov@gmail.com>

pkgname=warp-git
pkgver=r5.b140373
pkgrel=1
pkgdesc='A fast preprocessor for C and C++'
arch=(i686 x86_64)
url='https://github.com/facebook/warp'
license=(custom)
depends=(gcc-libs)
makedepends=(git gdc)
source=(git+https://github.com/facebook/warp.git)
md5sums=('SKIP')

pkgver() {
  cd warp
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd warp
  make
}

package() {
  cd warp

  install -d "$pkgdir"/usr/bin
  install fwarp fwarpdrive_gcc4_7_1 fwarpdrive_gcc4_8_1 fwarpdrive_clang3_2 fwarpdrive_clang3_4 fwarpdrive_clangdev "$pkgdir"/usr/bin

  # boost-like license
  install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

