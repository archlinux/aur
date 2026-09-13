# Maintainer: Happilli <https://github.com>
pkgname=ryu
pkgver=0.0.2
pkgrel=1
pkgdesc="Collection of Qt6 QML plugins for ryu.."
arch=('x86_64')
license=('BSD-2-Clause')
depends=('qt6-base' 'qt6-declarative' 'cliphist' 'wl-clipboard' 'pipewire')
makedepends=('cmake' 'ninja' 'qt6-tools' 'qt6-shadertools')
conflicts=('cleave' 'clipsh' 'drawness' 'sqliter' 'warsa')
replaces=('cleave' 'clipsh' 'drawness' 'sqliter' 'warsa')
provides=('cleave' 'clipsh' 'drawness' 'sqliter' 'warsa')
url="https://github.com/Happilli/ryu"
source=("$pkgname-$pkgver.tar.gz::https://github.com/Happilli/ryu/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('b9a28e59339ff9fbdbc5ddba892284a64b11b28cebf7609c73e20d05bee25c87')

build() {
  cmake -B build -S "$pkgname-$pkgver" -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr -G Ninja && ninja -C build
}

package() {
  DESTDIR="$pkgdir" ninja -C build install
  install -Dm644 "$pkgname-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

