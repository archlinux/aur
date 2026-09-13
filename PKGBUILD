# Maintainer: Happilli <https://github.com>
pkgname=ryu
pkgver=0.0.1
pkgrel=1
pkgdesc="Collection of Qt6 QML plugins for ryu.."
arch=('x86_64')
license=('BSD-2-Clause')
depends=('qt6-base' 'qt6-declarative' 'cliphist' 'wl-clipboard')
makedepends=('cmake' 'ninja' 'qt6-tools' 'qt6-shadertools')
conflicts=('cleave' 'clipsh' 'drawness' 'sqliter' 'warsa')
replaces=('cleave' 'clipsh' 'drawness' 'sqliter' 'warsa')
provides=('cleave' 'clipsh' 'drawness' 'sqliter' 'warsa')
url="https://github.com/Happilli/ryu"
source=("$pkgname-$pkgver.tar.gz::https://github.com/Happilli/ryu/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('5aabd5b348ef45ec02f5ed24cd3169b33a7a788d7ce8451bf8991c2d72000b03')

build() {
  cmake -B build -S "$pkgname-$pkgver" -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr -G Ninja && ninja -C build
}

package() {
  DESTDIR="$pkgdir" ninja -C build install
  install -Dm644 "$pkgname-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

