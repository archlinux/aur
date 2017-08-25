# Keep in sync with AUR/chromium-vaapi:
#
# Possible replacements are listed in build/linux/unbundle/replace_gn_files.py
# Keys are the names in the above script; values are the dependencies in Arch
declare -rgA _system_libs=(
  #[ffmpeg]=ffmpeg           # https://crbug.com/731766
  [flac]=flac
  #[freetype]=freetype2      # https://crbug.com/pdfium/733
  [harfbuzz-ng]=harfbuzz-icu
  #[icu]=icu                 # Enable again when upstream supports ICU 59
  [libdrm]=
  [libjpeg]=libjpeg
  #[libpng]=libpng           # https://crbug.com/752403#c10
  #[libvpx]=libvpx           # https://bugs.gentoo.org/611394
  [libwebp]=libwebp
  #[libxml]=libxml2          # https://bugs.gentoo.org/616818
  [libxslt]=libxslt
  [opus]=opus
  [re2]=re2
  [snappy]=snappy
  [yasm]=
  [zlib]=minizip
)

pkgname=chromium-vaapi-bin
pkgver=60.0.3112.113
pkgrel=1
pkgdesc='Chromium compiled with VA-API support for Intel Graphics'
url='https://www.chromium.org/Home'
arch=('x86_64')
license=('BSD')
provides=('chromium')
conflicts=('chromium' 'chromium-vaapi')

depends=('gtk3' 'nss' 'alsa-lib' 'xdg-utils' 'libxss' 'libcups' 'libgcrypt'
         'ttf-font' 'systemd' 'dbus' 'libpulse' 'pciutils' 'json-glib'
         'desktop-file-utils' 'hicolor-icon-theme')
depends+=(${_system_libs[@]})
optdepends=('pepper-flash: support for Flash content'
            'kdialog: needed for file dialogs in KDE'
            'gnome-keyring: for storing passwords in GNOME keyring'
            'kwallet: for storing passwords in KWallet'
            'libva-intel-driver: Needed to support VA-API for Intel graphics cards')

source_x86_64=("https://github.com/maximbaz/$pkgname/raw/master/$arch/chromium-vaapi-$pkgver-$pkgrel-$arch.pkg.tar.xz")
sha256sums_x86_64=('3200aa74146f74f84287a74a829bf30f2db9abe56ea8809089d91b05f035c04c')

package() {
  cp -ar "$srcdir/usr" "$pkgdir/usr"
  chmod 4755 "$pkgdir/usr/lib/chromium/chrome-sandbox"
}
