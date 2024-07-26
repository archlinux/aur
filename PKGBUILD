# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=key-rack
pkgver=0.4.0
pkgrel=1
pkgdesc="View and edit app secrets"
arch=('x86_64')
url="https://gitlab.gnome.org/sophie-h/key-rack"
license=('GPL-3.0-or-later')
depends=('libadwaita')
makedepends=('cargo' 'git' 'meson')
source=("git+https://gitlab.gnome.org/sophie-h/key-rack.git#tag=$pkgver")
sha256sums=('4f4fd53e206222b11eb0b4bcb1436b373cb6ec4cd483c91c972c4a9850e993d1')

prepare() {
  cd "$pkgname"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "$pkgname"
  export RUSTUP_TOOLCHAIN=stable
  arch-meson . build
  meson compile -C build
}

package() {
  cd "$pkgname"
  meson install -C build --destdir "$pkgdir"
}
