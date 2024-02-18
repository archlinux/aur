# Maintainer: Spencer-0003 <gents_guru814 at simplelogin dot co>

pkgname=resonate-git
pkgdesc="Lightweight subsonic music player powered by Rust and React."
pkgver=3be5f5a
pkgrel=1
arch=("x86_64")
url="https://git.usesarchbtw.lol/resonate/resonate"
depends=(cairo gcc-libs gdk-pixbuf2 glib2 glibc gstreamer gst-plugins-good gtk3 libsoup3 openssl webkit2gtk-4.1)
makedepends=(cargo git nodejs pnpm)
source=("git+https://git.usesarchbtw.lol/resonate/resonate.git" "resonate.desktop")
sha256sums=("SKIP" "SKIP")
license=("AGPL-3.0-only")

prepare() {
  cd resonate
  pnpm i
}

pkgver() {
  cd resonate
  git rev-parse --short HEAD
}

build() {
  cd resonate
  pnpm tauri build
}

package() {
  install -Dm0644 resonate.desktop "$pkgdir/usr/share/applications/resonate.desktop"

  cd resonate
  install -Dm0755 src-tauri/target/release/resonate "$pkgdir/usr/bin/resonate"
  install -Dm0644 src-tauri/icons/desktop.png "$pkgdir/usr/share/pixmaps/resonate.png"
  install -Dm0644 LICENSE "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"
}

