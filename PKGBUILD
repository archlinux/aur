# Contributor: Balló György <ballogyor+arch at gmail dot com>

pkgname=gsvg
pkgver=0.5.3+140+gcbbb996
pkgrel=1
pkgdesc="GObject API for SVG"
arch=(x86_64)
url="https://gitlab.com/pwmc/gsvg"
license=(LGPL2.1)
depends=(gxml graphene)
makedepends=(git meson vala)
_commit=cbbb9967bd86fc5e602e407859239bf2dff4abad  # master~13
source=("git+https://gitlab.com/pwmc/gsvg#commit=$_commit")
sha256sums=('SKIP')

pkgver() {
  cd $pkgname
  git describe --tags | sed 's/-/+/g'
}

build() {
  arch-meson $pkgname build
  ninja -C build
}

check() {
  meson test -C build --print-errorlogs
}

package() {
  DESTDIR="$pkgdir" meson install -C build
}
