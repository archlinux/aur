# Maintainer: Térence Clastres <t dot clastres at gmail dot com>
# PKGBUILD based on the one from https://aur.archlinux.org/packages/lite

pkgname=lite-xl
_pkgname=lite
pkgver=1.16.11
pkgrel=1
pkgdesc='A lightweight text editor written in Lua'
arch=('x86_64')
url="https://github.com/franko/$pkgname"
license=('MIT')
depends=('agg' 'lua52' 'sdl2')
makedepends=('meson')
conflicts=("$_pkgname")
provides=("$_pkgname")
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('63c24570299a7200eb94c0fa064c823769835f78a9b93c497d120f7a99c91057')

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

