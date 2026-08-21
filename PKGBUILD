# Maintainer: xiryuu < farrel2008ganteng@protonmail.com >
pkgname=limusic-bin
_pkgname=limusic
pkgver=0.5.3
pkgrel=1
pkgdesc="Feature rich, native desktop, YouTube Music client. Tauri + Rust + SvelteKit, ad-free playback through libmpv, Last.fm scrobbling and Discord Rich Presence, no Electron."
arch=("x86_64")
url="https://github.com/SimoHypers/limusic"
license=("GPL-3.0-only")
depends=("gtk3" "glib2" "glibc" "mpv" "libusb" "webkit2gtk-4.1" "db5.3" "hicolor-icon-theme")
options=("!strip" "!buildflags")

source=("${pkgname}-${pkgver}.AppImage::https://github.com/SimoHypers/limusic/releases/download/v${pkgver}/limusic_${pkgver}_amd64.AppImage")
sha256sums=("4e5f075634efb481159cc65f050d90b8e631409faea0f2e259ba0fc2ec10a4eb")

prepare() {
  cd "$srcdir"
  chmod +x "${pkgname}-${pkgver}.AppImage"
  ./"${pkgname}-${pkgver}.AppImage" --appimage-extract
}

package() {
  local _root="$srcdir/squashfs-root"

  install -dm755 "$pkgdir/usr/lib/limusic"
  cp -r "$_root/usr/lib/"* "$pkgdir/usr/lib/limusic/"
  cp -r "$_root/usr/bin/"* "$pkgdir/usr/lib/limusic/"

  cp -r "$_root/usr/share" "$pkgdir/usr/"
  install -dm755 "$pkgdir/usr/bin"
  cp -r "$_root/usr/bin/"* "$pkgdir/usr/bin/"

  rm -rf "$pkgdir/usr/share/glib-2.0"
  rm -rf "$pkgdir/usr/share/doc"
}
