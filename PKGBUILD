# Maintainer: 0x0D <0xOD@proton.me>

pkgname=mokii
_pkgname=Mokii
pkgver=0.1.0
pkgrel=1
pkgdesc="A modern, colorful ls replacement written in C++23 with Unicode icons and git integration"
arch=('x86_64')
url="https://github.com/MochiiLinux/Mokii"
license=('MIT')
depends=('gcc-libs')
makedepends=('cmake' 'ninja')
source=("$pkgname-$pkgver.tar.gz::https://github.com/MochiiLinux/Mokii/archive/v$pkgver.tar.gz")
sha256sums=('SKIP')

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
