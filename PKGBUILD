# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
pkgname=video-trimmer
pkgver=0.8.1
pkgrel=1
pkgdesc="Trim videos quickly"
arch=('x86_64')
url="https://apps.gnome.org/app/org.gnome.gitlab.YaLTeR.VideoTrimmer"
license=('GPL3')
depends=('ffmpeg' 'gst-plugins-good' 'libadwaita')
makedepends=('blueprint-compiler' 'cargo' 'git' 'meson')
checkdepends=('appstream-glib')
source=("https://gitlab.gnome.org/YaLTeR/video-trimmer/-/archive/v$pkgver/$pkgname-v$pkgver.tar.gz")
sha256sums=('c6fb54d8315b0933584eba379f7d32cc24e0f9abb99341aedcfd81fdc7477380')

prepare() {
  cd "$pkgname-v$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --target "$CARCH-unknown-linux-gnu"
}

build() {
  export RUSTUP_TOOLCHAIN=stable
  arch-meson "$pkgname-v$pkgver" build
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs
}

package() {
  meson install -C build --destdir "$pkgdir"
}
