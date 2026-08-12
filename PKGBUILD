# Maintainer: LazySeldi <197385604+LazySeldi@users.noreply.github.com>
pkgname=lib-lazybios
pkgver=2.0.0
pkgrel=1
pkgdesc="Lightweight SMBIOS/DMI parsing library"
arch=('x86_64' 'i686' 'aarch64')
url="https://github.com/LazySeldi/lazybios"
license=('LGPL-2.1-or-later')
depends=('glibc')
makedepends=('cmake')
source=("https://github.com/LazySeldi/lazybios/releases/download/$pkgver/lazybios-$pkgver.tar.gz")
sha256sums=('3183a51997c3866eafbbb52709d3a26130251fbfd973906fbc6b5be4e9cb26e7')

build() {
  cmake -B build -S "$srcdir/lazybios-$pkgver" \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=lib
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
  install -Dm644 "$srcdir/lazybios-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
