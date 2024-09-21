# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=impression
pkgver=3.3.0
pkgrel=1
pkgdesc="A straight-forward modern application to create bootable drives."
arch=('x86_64')
url="https://apps.gnome.org/Impression"
license=('GPL-3.0-or-later')
depends=('libadwaita' 'udisks2')
makedepends=('blueprint-compiler' 'cargo' 'meson')
source=("https://gitlab.com/adhami3310/Impression/-/archive/v$pkgver/Impression-v$pkgver.tar.gz")
sha256sums=('116d4570a2944ff2df7fc1394382d162ebaa93f9fc7f4a202e77e4ff3a28ea81')

prepare() {
  cd "Impression-v$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  export RUSTUP_TOOLCHAIN=stable
  arch-meson "Impression-v$pkgver" build
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs || :
}

package() {
  meson install -C build --destdir "$pkgdir"
}
