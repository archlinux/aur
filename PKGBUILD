# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=concessio
pkgver=1.0.0
pkgrel=1
pkgdesc="Understand File Permissions"
arch=('x86_64')
url="https://apps.gnome.org/Concessio"
license=('GPL-3.0-or-later')
depends=(
  'gtk4'
  'libadwaita'
  'libgee'
)
makedepends=(
  'blueprint-compiler'
  'meson'
  'vala'
)
source=("$pkgname-$pkgver.tar.gz::https://github.com/ronniedroid/concessio/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('484295fea983c1541b52c494bd8540a3a6f1fbb6e9d93be0cfcfd67674768c54')

build() {
  arch-meson "$pkgname-$pkgver" build
  meson compile -C build
}

check() {
  meson test -C build --no-rebuild --print-errorlogs
}

package() {
  meson install -C build --no-rebuild --destdir "$pkgdir"
}
