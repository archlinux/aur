# Maintainer: PharmaRacist
pkgname=noon-libqt
pkgver=2.1
pkgrel=1
pkgdesc="PharmaRacist's Perspective of a Desktop - Qt Library package"
arch=('x86_64' 'aarch64')
url="https://github.com/PharmaRacist/Noon-libqt"
license=('MIT')
depends=('qt6-base' 'qt6-declarative' 'qt6-sql')
makedepends=('cmake' 'ninja' 'git')
source=("git+https://github.com/PharmaRacist/Noon-libqt.git")
sha256sums=('SKIP')

pkgver() {
  cd Noon-libqt
  git describe --tags --abbrev=0 2>/dev/null | sed 's/^v//' || \
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cmake -S Noon-libqt -B build \
    -G Ninja \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
  install -Dm644 Noon-libqt/LICENSE \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
