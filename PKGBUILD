# Maintainer: Daniel Löbl <dloebl.2000@gmail.com>
pkgname=libcgif
pkgver=0.0.3
pkgrel=1
pkgdesc="A fast and lightweight GIF encoding library"
arch=('x86_64')
url="https://github.com/dloebl/cgif"
license=('MIT')
makedepends=('meson' 'ninja')
depends=('glibc')
source=("$pkgname-$pkgver.tar.gz::https://github.com/dloebl/cgif/archive/refs/tags/V$pkgver.tar.gz")
sha256sums=('160e88bc126ad0f1fa6ae07b7660852242efefe687bc0181e3b5acea01939bd4')

build() {
 cd "$srcdir/cgif-$pkgver/"
 arch-meson build/ --backend=ninja --optimization=2
 meson compile -C build/
}
package() {
 mkdir -p "$pkgdir/usr/lib/" "$pkgdir/usr/include/" "$pkgdir/usr/share/licenses/$pkgname/"
 meson install -C "cgif-$pkgver/build/" --destdir "$pkgdir"
 cp "$srcdir/cgif-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/."
}
check() {
 meson test -C "cgif-$pkgver/build/"
}
