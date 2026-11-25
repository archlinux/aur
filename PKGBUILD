# Maintainer: watasuke <watasuke102@gmail.com>

pkgname=zwin-protocols
_pkgname=zwin
pkgver=0.1.1
pkgrel=1
pkgdesc='Protocol definitions for the Zwin 3D windowing system on top of Wayland'
arch=('any')
url='https://github.com/zwin-project/zwin'
license=('MIT')
makedepends=('meson' 'wayland' 'libxml2')
source=("$_pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('ce01d0ed01d89c5a02554b31b6c045a15da4af513233c715f43a251862ee238d')

build() {
  arch-meson "$_pkgname-$pkgver" build -Dwerror=false
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs
}

package() {
  meson install -C build --destdir "$pkgdir"
  install -Dm644 "$_pkgname-$pkgver/LICENSE" -t "$pkgdir/usr/share/licenses/$pkgname"
}
