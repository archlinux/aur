# Maintainer: Fabian Bornschein <fabiscafe@archlinux.org>
# Maintainer: Mattia Borda <mattiagiovanni.borda@icloud.com>

pkgname=text-engine
pkgver=0.1.1
pkgrel=4
pkgdesc="A lightweight rich-text framework for GTK"
arch=('x86_64')
url="https://github.com/mjakeman/text-engine"
license=('MPL-2.0 OR LGPL-2.1-or-later')
depends=(
  glib2
  glibc
  gtk4
  json-glib
  libadwaita
  libxml2
  pango
)
makedepends=(
  git
  meson
)
source=("git+https://github.com/mjakeman/text-engine.git#tag=v$pkgver")
b2sums=('0fc9df6676be6d4b6fb39fc19bc24aa8d9b586ec37a6c81dde22c4767e44bf5425f0f6a6a52a926708b0b9a6f935a8af43b88627a60cb98df89317c94c559c91')

build() {
  # workaround incompatible-pointer-types and return-mismatch
  # https://github.com/mjakeman/text-engine/issues/37
  CFLAGS+=" -Wno-incompatible-pointer-types -Wno-return-mismatch"

  arch-meson $pkgname build
  meson compile -C build
}

check() {
  meson test -C build
}

package() {
  meson install -C build --destdir "$pkgdir"
}
