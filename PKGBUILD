# Maintainer: Richard Fakenberg (OK1BR) <rifak@protonmail.com>
# AUR package for the tagged release.
pkgname=sdr-for-linux
_pkgtag=0.5.0
pkgver=0.5.0
pkgrel=1
pkgdesc="Modern GTK4 SDR application for HPSDR / ANAN transceivers (piHPSDR engine, WDSP)"
# aarch64 not claimed until verified on ARM (CI builds x86_64 only).
arch=('x86_64')
url="https://github.com/OK1BR/sdr-for-linux"
license=('GPL-3.0-or-later')
depends=('gtk4' 'libadwaita' 'fftw' 'openssl' 'zlib' 'libpipewire'
         'libwebsockets')
# opus: required by meson at configure time, but the binary never links it
# (no opus API used) — build-only, so makedepends not depends.
makedepends=('meson' 'opus')
source=("$pkgname-$_pkgtag.tar.gz::$url/archive/refs/tags/v$_pkgtag.tar.gz")
sha256sums=('f5ad2d528e4ca5bdb1ec9a137b481795eab328d5d68991f28d39ef7f88471fca')

build() {
  arch-meson "$pkgname-$_pkgtag" build
  meson compile -C build
}

package() {
  meson install -C build --destdir "$pkgdir"
  install -Dm644 "$pkgname-$_pkgtag/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
