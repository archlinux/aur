pkgname=tts-helper
pkgver=6.7.0
pkgrel=1
pkgdesc="An application to help streamers manage TTS events."
arch=('x86_64' 'aarch64')
url="https://github.com/uhuh/tts-helper"
license=('MIT')
depends=('cairo' 'desktop-file-utils' 'gdk-pixbuf2' 'glib2' 'gtk3' 'hicolor-icon-theme' 'libsoup' 'pango' 'webkit2gtk-4.1')
options=('!strip' '!emptydirs')
install=${pkgname}.install
source_x86_64=("${url}/releases/download/tts-helper-v${pkgver}/TTS.Helper_${pkgver}_amd64.deb")
sha256sums_x86_64=('92f3db06efe88530979f1ef82590b736f05fc953bc60e7381f38ae133163ae38')

package() {
  mkdir -p temp_extraction
  ar x "TTS.Helper_${pkgver}_amd64.deb" --output=temp_extraction

  if [ -f temp_extraction/data.tar.zst ]; then
      tar -I zstd -xf temp_extraction/data.tar.zst -C "${pkgdir}"
  elif [ -f temp_extraction/data.tar.gz ]; then
      tar -xzf temp_extraction/data.tar.gz -C "${pkgdir}"
  else
      tar -xf temp_extraction/data.tar.xz -C "${pkgdir}"
  fi

  chmod +x "${pkgdir}/usr/bin/tts-helper"
}
