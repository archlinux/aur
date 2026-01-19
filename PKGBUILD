# Maintainer: 0x0D <0xOD@proton.me>

pkgname=mokii
_pkgname=Mokii
pkgver=0.1.7
pkgrel=1
pkgdesc="A modern, colorful ls replacement written in C++23 with Unicode icons"
arch=('x86_64')
url="https://github.com/MochiiLinux/Mokii"
license=('MIT')
depends=('gcc-libs')
makedepends=('cmake' 'ninja')
options=(!debug)
source=("$_pkgname-$pkgver.tar.gz::https://github.com/MochiiLinux/Mokii/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('29e895141ed818b0000e0be6b677a5fe8660a2c4b6769df1c292421dba2efe7c')

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
