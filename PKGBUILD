# Maintainer: Happilli <https://github.com/happilli>
pkgname=ryu
pkgver=0.0.29
pkgrel=1
pkgdesc="Collection of Qt6 QML plugins for ryu.."
arch=('x86_64')
license=('BSD-2-Clause')
depends=('qt6-base' 'qt6-declarative' 'cliphist' 'wl-clipboard' 'pipewire')
makedepends=('cmake' 'ninja' 'qt6-tools' 'qt6-shadertools')
url="https://github.com/Happilli/ryu"
source=("$pkgname-$pkgver.tar.gz::https://github.com/Happilli/ryu/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('e8ef660c1cb9b1f15fb727c06f814589accd38a99a210f05b83e4144c0e34f19')

build() {
  cmake -B build -S "$pkgname-$pkgver" -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr -G Ninja && ninja -C build
}

package() {
  DESTDIR="$pkgdir" ninja -C build install
  install -Dm644 "$pkgname-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

