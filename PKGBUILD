# Maintainer: 0x0D <0xOD@proton.me>

pkgname=mokii
_pkgname=Mokii
pkgver=0.1.2
pkgrel=1
pkgdesc="A modern, colorful ls replacement written in C++23 with Unicode icons and git integration"
arch=('x86_64')
url="https://github.com/MochiiLinux/Mokii"
license=('MIT')
depends=('gcc-libs')
makedepends=('cmake' 'ninja')
options=(!debug)
source=("$_pkgname-$pkgver.tar.gz::https://github.com/MochiiLinux/Mokii/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('6aa55b3bfe460139119b2d3cc363d56f76ffbc5e94e23d8d1ee74c08af6de51c')

build() {
  cd "$srcdir/$_pkgname-$pkgver"

  cmake -S . -B build \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -G Ninja

  cmake --build build
}

package() {
  cd "$srcdir/$_pkgname-$pkgver"

  DESTDIR="$pkgdir" cmake --install build

  install -Dm644 LICENSE \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 README.md \
    "$pkgdir/usr/share/doc/$pkgname/README.md"
}
