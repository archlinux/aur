# Contributor: Balló György <ballogyor+arch at gmail dot com>

pkgname=emwm
pkgver=1.3.1
pkgrel=1
pkgdesc='Fork of the Motif Window Manager with fixes and enhancements'
arch=(x86_64)
url='https://fastestcode.org/emwm.html'
license=(LGPL-2.1-or-later)
depends=(
  glibc
  libx11
  libxext
  libxinerama
  libxrandr
  libxt
  openmotif
)
source=(
  "https://fastestcode.org/dl/emwm-src-$pkgver.tar.xz"
  emwm.desktop
)
b2sums=(
  2af9f236b5d5d18328ad683fc2d0d1ae5978d3cec03724add9a960fc86cb44846d56f46034eee8f61e731c9cb0edd6e033ebe450c0d63ea386ac5276528a72a6
  950dc465376fae6f762600e1d28b578ca138b8d7425fe2f54be38787c24247bee5c13d280283d137a0cb2a7bfbefaf1343b6a9686386c8f2e7f840b75ac0d0ef
)

build() {
  cd $pkgname-src-$pkgver
  make
}

package () {
  cd $pkgname-src-$pkgver
  install -dm755 "$pkgdir/usr/bin"
  make PREFIX="$pkgdir/usr" RCDIR="$pkgdir/etc/X11" APPLRESDIR="$pkgdir/etc/X11/app-defaults" install
  install -Dm644 -t "$pkgdir/usr/share/xsessions" ../emwm.desktop
}
