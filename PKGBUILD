# Maintainer: Térence Clastres <t dot clastres at gmail dot com>
# PKGBUILD based on the one from https://aur.archlinux.org/packages/lite

pkgname=lite-xl
_pkgname=lite
pkgver=1.16.6
pkgrel=1
pkgdesc='A lightweight text editor written in Lua'
arch=('x86_64')
url="https://github.com/franko/$pkgname"
license=('MIT')
depends=('agg' 'lua52' 'sdl2')
makedepends=('meson' 'gendesk')
conflicts=("$_pkgname")
provides=("$_pkgname")
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('477b9a62d6f31109a288e63e79eb3189f99d2d7c03b1f395fc1d1e072131f747')

build() {
    cd "$pkgname-$pkgver"
    arch-meson build
    meson compile -C build
}

package() {
  cd "$pkgname-$pkgver"

  DESTDIR="$pkgdir" meson install -C build
  
  install -Dm 644 "dev-utils/$_pkgname.svg" \
	"$pkgdir/usr/share/icons/hicolor/scalable/apps/$pkgname.svg"
  install -Dm 644 "dev-utils/$pkgname.desktop" -t "$pkgdir/usr/share/applications"
  install -Dm 644 "LICENSE" -t "$pkgdir/usr/share/licenses/$pkgname"
}

