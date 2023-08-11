# Maintainer: Matvey Ryabchikov <orlition@gmail.com>
pkgname=ronix
pkgver=0.4.0
pkgrel=1
pkgdesc="A customizable music player and library manager"
arch=('x86_64')
url="https://github.com/ronanru/ronix"
license=('AGPL3')
depends=(
  "base-devel"
  "webkit2gtk"
  "curl"
  "wget"
  "file"
  "openssl"
  "appmenu-gtk-module"
  "gtk3"
  "libappindicator-gtk3"
  "librsvg"
  "libvips"
  "yt-dlp"
  "sacad"
  "gstreamer")
makedepends=("rust" "nodejs>=18" "pnpm")
source=("ronix::https://github.com/ronanru/ronix/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=("ebd57546c6a83014c0fc7b5071eb8683ed3561c820882cff843fcbfe8da7c491")

prepare() {
  cd ronix-$pkgver
  pnpm install --frozen-lockfile
}

build() {
  cd ronix-$pkgver
  pnpm run tauri build --bundles
}

package() {
  cd ronix-$pkgver
  install -Dm755 src-tauri/target/release/ronix "$pkgdir/usr/bin/ronix"
  install -Dm644 ronix.desktop "$pkgdir/usr/share/applications/ronix.desktop"
  install -Dm644 src-tauri/icons/128x128.png "$pkgdir/usr/share/pixmaps/ronix.png"
}
