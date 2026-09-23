# Maintainer: Ahsan Haris Ahmed <ahsanharisahmed@gmail.com>
pkgname=cha-craft
pkgver=1.0.0
pkgrel=1
pkgdesc="A cozy barista simulation built with C++17 and raylib"
arch=('x86_64')
url="https://github.com/harisahmed05/cha_craft"
license=('MIT')
depends=('raylib' 'glibc')
makedepends=('cmake' 'gcc')
source=("$pkgname-$pkgver.tar.gz::https://github.com/harisahmed05/cha_craft/archive/refs/tags/v$pkgver.tar.gz"
        "cha-craft.desktop")
sha256sums=('eff75b7761b23e4d2ae27e872639dbf124067dd018f33fdb0f0dd48e9f06cc4c'
            '2d867aef51f1978a718b9b4daf3dbe6628c2f1a4b2edb2499adadcca6ffafd58')

build() {
  cd "$srcdir/cha_craft-$pkgver"
  cmake -S . -B build \
      -DCMAKE_BUILD_TYPE=Release \
      -DCMAKE_INSTALL_PREFIX=/usr
  cmake --build build -j
}

package() {
  cd "$srcdir/cha_craft-$pkgver"

  # Install binary
  install -Dm755 build/cha_craft "$pkgdir/usr/bin/cha-craft"

  # Install license
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  # Install desktop entry
  install -Dm644 "$srcdir/cha-craft.desktop" "$pkgdir/usr/share/applications/cha-craft.desktop"
}
