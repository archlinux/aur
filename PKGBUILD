# Contributor: Balló György <ballogyor+arch at gmail dot com>

pkgname=emwm-utils
pkgver=1.3.2
pkgrel=1
pkgdesc='Minimalist session manager and a /toolchest/ like application launcher for Unix/X11'
arch=(x86_64)
url='https://fastestcode.org/emwm.html'
license=(LGPL-2.1-or-later)
depends=(
  bash
  emwm
  glibc
  libx11
  libxcrypt
  libxinerama
  libxrandr
  libxss
  libxt
  openmotif
)
source=(
  "https://fastestcode.org/dl/emwm-utils-src-$pkgver.tar.xz"
  xmsm.desktop
)
b2sums=(
  7d4e1b4749cae9ff3bbfc31ced62d3dc16be0d8c1cfe132b532a1bdca6d103dfb29543dd297c1669e2652c6cbe0b0fe50b1ba09058b01f56eeae9204e4e622b5
  38e5312a8519271579adfba7b43d5ced16d2695c63128262f9173673818672b1c04db279a037e28daf536668334d52e412c7e0f18f7a88355abfaafb284135d4
)

build() {
  cd $pkgname-src-$pkgver
  make
}

package () {
  cd $pkgname-src-$pkgver
  install -dm755 "$pkgdir/usr/bin"
  make PREFIX="$pkgdir/usr" RCDIR="$pkgdir/etc/X11" APPLRESDIR="$pkgdir/etc/X11/app-defaults" install
  install -Dm644 -t "$pkgdir/usr/share/xsessions" ../xmsm.desktop
}
