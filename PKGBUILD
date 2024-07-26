# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
# Contributor: th1nhhdk <th1nhhdk@tutanota.com>
# Contributor: Rafael Fontenelle <rafaelff@gnome.org>
pkgname=gnome-obfuscate
pkgver=0.0.10
pkgrel=2
pkgdesc="Censor private information."
arch=('x86_64')
url="https://gitlab.gnome.org/World/obfuscate"
license=('GPL-3.0-or-later')
depends=('libadwaita')
makedepends=('cargo' 'git' 'meson')
source=("git+https://gitlab.gnome.org/World/obfuscate.git#tag=$pkgver")
sha256sums=('1cd009d43e84fde922b975071979c0d5ce005eefa047b9fd9189d538e640a99c')

prepare() {
  cd obfuscate
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  export RUSTUP_TOOLCHAIN=stable
  arch-meson obfuscate build
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs
}

package() {
  meson install -C build --destdir "$pkgdir"
}
