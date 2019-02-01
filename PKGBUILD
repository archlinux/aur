pkgname=chromium-vaapi-bin
pkgver=72.0.3626.81
pkgrel=2
pkgdesc='Chromium with VA-API support to enable hardware acceleration, pre-compiled'
url='https://www.chromium.org/Home'
arch=('x86_64')
license=('BSD')
provides=('chromium' 'chromium-vaapi')
conflicts=('chromium' 'chromium-vaapi')

depends=('gtk3' 'nss' 'alsa-lib' 'xdg-utils' 'libxss' 'libcups' 'libgcrypt'
         'ttf-font' 'systemd' 'dbus' 'libpulse' 'pciutils' 'json-glib'
         'desktop-file-utils' 'hicolor-icon-theme' 'libva')
optdepends=('pepper-flash: support for Flash content'
            'kdialog: needed for file dialogs in KDE'
            'gnome-keyring: for storing passwords in GNOME keyring'
            'kwallet: for storing passwords in KWallet'
            'libva-intel-driver: support HW acceleration on Intel graphics cards'
            'libva-mesa-driver: support HW acceleration on AMD graphics cards'
            'libva-vdpau-driver-chromium: support HW acceleration on Nvidia graphics cards')

validpgpkeys=('EB4F9E5A60D32232BB52150C12C87A28FEAC6B20')
source=("https://pkgbuild.com/~maximbaz/repo/chromium-vaapi-${pkgver}-${pkgrel}-${arch}.pkg.tar.xz"{,.sig})
sha256sums=('8adc3c45428d75b283bc7a8eb11fb917abc57a4bfcde3c6c88366f29086c20f1'
            'SKIP')

# Keep in sync with AUR/chromium-vaapi:
#
# Possible replacements are listed in build/linux/unbundle/replace_gn_files.py
# Keys are the names in the above script; values are the dependencies in Arch
declare -gA _system_libs=(
  [ffmpeg]=ffmpeg
  [flac]=flac
  [fontconfig]=fontconfig
  [freetype]=freetype2
  [harfbuzz-ng]=harfbuzz
  [icu]=icu
  [libdrm]=
  [libjpeg]=libjpeg
  #[libpng]=libpng            # https://crbug.com/752403#c10
  #[libvpx]=libvpx            # needs unreleased libvpx
  [libwebp]=libwebp
  [libxml]=libxml2
  [libxslt]=libxslt
  [opus]=opus
  [re2]=re2
  [snappy]=snappy
  [yasm]=
  [zlib]=minizip
)
depends+=(${_system_libs[@]})

package() {
  cp -ar "$srcdir/usr" "$pkgdir/usr"
  chmod 4755 "$pkgdir/usr/lib/chromium/chrome-sandbox"
}
