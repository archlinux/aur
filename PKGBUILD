# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=tailor
pkgver=1.3.0
pkgrel=1
pkgdesc="Create bootable drives"
arch=('x86_64')
url="https://altlinux.space/alt-gnome/Tailor/"
license=('GPL-3.0-or-later')
depends=(
  'gtk4'
  'libadwaita'
  'libgee'
  'libosinfo'
  'libsoup3'
  'udisks2'
)
makedepends=(
  'blueprint-compiler'
  'git'
  'meson'
  'vala'
)
source=("git+https://altlinux.space/alt-gnome/Tailor.git#tag=v$pkgver")
sha256sums=('e6320960d35eb8970a6cfcf0cf13c21bd6954c819cd97c4752baa0a41934c280')

build() {
  arch-meson Tailor build
  meson compile -C build
}

check() {
  meson test -C build --no-rebuild --print-errorlogs
}

package() {
  meson install -C build --no-rebuild --destdir "$pkgdir"
}
