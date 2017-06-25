# Keep in sync with AUR/chromium-vaapi:
#
# Possible replacements are listed in build/linux/unbundle/replace_gn_files.py
# Keys are the names in the above script; values are the dependencies in Arch
declare -rgA _system_libs=(
  #[ffmpeg]=ffmpeg     # https://crbug.com/723537
  [flac]=flac
  [harfbuzz-ng]=harfbuzz-icu
  #[icu]=icu           # Enable again when upstream supports ICU 59
  [libdrm]=
  [libjpeg]=libjpeg
  [libpng]=libpng
  #[libvpx]=libvpx     # https://bugs.gentoo.org/show_bug.cgi?id=611394
  [libwebp]=libwebp
  [libxml]=libxml2
  [libxslt]=libxslt
  [re2]=re2
  [snappy]=snappy
  [yasm]=
  [zlib]=minizip
)

pkgname=chromium-vaapi-bin
pkgver=59.0.3071.109
pkgrel=1
pkgdesc='Chromium compiled with VA-API support for Intel Graphics'
url='https://www.chromium.org/Home'
arch=('x86_64')
license=('BSD')
provides=('chromium')
conflicts=('chromium' 'chromium-vaapi')

depends=('gtk3' 'nss' 'alsa-lib' 'xdg-utils' 'libxss' 'libcups' 'libgcrypt'
         'ttf-font' 'systemd' 'dbus' 'libpulse' 'pciutils' 'desktop-file-utils'
         'hicolor-icon-theme')
depends+=(${_system_libs[@]})
optdepends=('kdialog: needed for file dialogs in KDE'
            'gnome-keyring: for storing passwords in GNOME keyring'
            'kwallet: for storing passwords in KWallet'
            'libva-intel-driver: Needed to support VA-API for Intel graphics cards')

source_x86_64=("https://github.com/maximbaz/$pkgname/raw/master/$arch/chromium-vaapi-$pkgver-$pkgrel-$arch.pkg.tar.xz")
sha256sums_x86_64=('71b3d42fc88e20308bfb52a4f91dd69fb3ac806dc3655efc5fff383ca124d78c')

package() {
  cp -ar "$srcdir/usr" "$pkgdir/usr"
  chmod 4755 "$pkgdir/usr/lib/chromium/chrome-sandbox"
}
