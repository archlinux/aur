# Maintainer: tcg <aur-tcg@emailaddress.biz>

pkgname=tcg-git
pkgver=0.2.35
pkgrel=1
pkgdesc="cgroups for terminals"
arch=('x86_64')
url="https://github.com/zasdfgbnm/tcg"
license=('MIT')
depends=('boost-libs')
makedepends=('git' 'cmake' 'boost')
source=("git+$url")
sha256sums=('SKIP')

build() {
  cd "$srcdir/tcg"
  git submodule update --init --recursive
  mkdir -p build
  cd build
  cmake --config Release ..
  make -j
}

package() {
  cd "$srcdir/tcg"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm4755 build/tcg "${pkgdir}/usr/bin/tcg"
}
