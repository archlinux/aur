# Maintainer: Adrian Siekierka <kontakt at asie dot pl>

pkgname=kevedit
pkgver=1.2.1
pkgrel=1
pkgdesc="ZZT world editor"
arch=("i686" "x86_64" "aarch64")
url="https://github.com/cknave/kevedit"
license=("GPL")
depends=("sdl2" "libpng")
makedepends=("cdrtools")
optdepends=("dosbox: in-game world testing support")
options=("debug")
source=("https://github.com/cknave/$pkgname/releases/download/$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=("7eb3277b8642a508eb48506da2e135ffe1708a0dcc855e294ede465a6f118d65")

build() {
  cd "$pkgname"-"$pkgver"

  ./configure \
    --prefix=/usr \
    --sysconfdir=/etc \
    --with-dosbox

  make
}

package(){
  cd "$pkgname"-"$pkgver"

  DESTDIR="$pkgdir" make install

  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/" COPYING legal.md
}
