# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
pkgname=video-trimmer
pkgver=0.8.0
pkgrel=2
pkgdesc="Trim videos quickly"
arch=('x86_64')
url="https://apps.gnome.org/app/org.gnome.gitlab.YaLTeR.VideoTrimmer"
license=('GPL3')
depends=('ffmpeg' 'gst-plugins-good' 'libadwaita')
makedepends=('blueprint-compiler' 'cargo' 'git' 'meson')
checkdepends=('appstream-glib')
source=("https://gitlab.gnome.org/YaLTeR/video-trimmer/-/archive/v$pkgver/$pkgname-v$pkgver.tar.gz")
sha256sums=('e84e00c3a1e30d6c638bf46cff1cbb8b68b4d4af26e4ce430716e15fa9d58dc7')

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
