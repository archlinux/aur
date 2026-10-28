# Maintainer: Julien Virey <julien.virey@gmail.com>

pkgname=parrot-tts-bin
_pkgname="${pkgname%%-*}"
pkgver=26.10.1
pkgrel=1
pkgdesc="A free, offline, private AI text-to-speech desktop app built on Rust 🦜"
url="https://github.com/rishiskhare/parrot"
_rawurl="${url/github.com/raw.githubusercontent.com}/refs/tags/v$pkgver"
license=("MIT")
arch=("x86_64" "aarch64")
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
depends=(
  alsa-lib
  cairo
  gdk-pixbuf2
  glib2
  glibc
  gtk3
  hicolor-icon-theme
  libsoup3
  openssl
  webkit2gtk-4.1
  gtk-layer-shell
  libpulse
  libsonic
  pcaudiolib
)

case $CARCH in
  x86_64) _CARCH='amd64' ;;
  aarch64) _CARCH='arm64' ;;
esac

source=(
  "LICENSE_$pkgver::$_rawurl/LICENSE"
)

source_aarch64=("$pkgname-$pkgver-$CARCH.deb::$url/releases/download/v$pkgver/${_pkgname^}_${pkgver}_$_CARCH.deb")
source_x86_64=("$pkgname-$pkgver-$CARCH.deb::$url/releases/download/v$pkgver/${_pkgname^}_${pkgver}_$_CARCH.deb")

sha256sums=('568d7ad8cb341b4926f7e4038c2bf8b6a9a0e69569cb6ee9f191f4e106e71cd0')
sha256sums_x86_64=('f7a37562465f8e9595edcc42dbfa157a92cee0748b459c1146621900c70ce7f5')
sha256sums_aarch64=('f7a37562465f8e9595edcc42dbfa157a92cee0748b459c1146621900c70ce7f5')

package() {
  bsdtar -xf "data.tar.gz" -C "$pkgdir"
  install -D -m 644 "LICENSE_$pkgver" -t "$pkgdir/usr/share/licenses/$pkgname/"
  sed -i 's/Categories=/Categories=Utility;/g' "$pkgdir/usr/share/applications/${_pkgname^}.desktop"
}
