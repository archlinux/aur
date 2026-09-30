# Maintainer: Ahsan Haris Ahmed <ahsanharisahmed@gmail.com>
pkgname=cha-craft
pkgver=1.0.0
pkgrel=2
pkgdesc="A cozy barista simulation built with C++17 and raylib"
arch=('x86_64')
url="https://github.com/harisahmed05/cha_craft"
license=('MIT')
depends=('raylib' 'glibc')
makedepends=('cmake' 'gcc')
source=("$pkgname-$pkgver.tar.gz::https://github.com/harisahmed05/cha_craft/archive/refs/tags/v$pkgver.tar.gz"
        "cha-craft.desktop")
sha256sums=('2d549d03e404156ce5f4601fa6ba1b340225ee50cb7343df7758c9a14e46ca42'
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
