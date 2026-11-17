# Maintainer: Antonio Vázquez <antoniovazquezblanco@gmail.com>

pkgname=sparkcli
pkgver=0.0.9
pkgrel=1
pkgdesc='C library to build CLI tools with colors, tables, trees, progress bars and more'
arch=('x86_64')
url='https://github.com/antoniovazquezblanco/sparkcli'
license=('GPL-3.0-or-later')
depends=('glibc')
makedepends=('meson' 'cmocka')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('13d9ae2e18bbd72a966566ac7dc268e4d01f61e1bb90d816d95e944e618c3b34')

build() {
  arch-meson "$pkgname-$pkgver" build \
    -Dexamples=disabled
}

check() {
  meson test -C build --print-errorlogs
}

package() {
  DESTDIR="$pkgdir" meson install -C build
  install -Dm644 "$pkgname-$pkgver/LICENSE.md" \
    -t "$pkgdir/usr/share/licenses/$pkgname/"
}
