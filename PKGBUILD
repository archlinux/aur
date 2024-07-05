# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Maintainer: Maxime Gauduin <alucryd@archlinux.org>

pkgname=steam-native-runtime
pkgver=1.0.0.75
pkgrel=4
pkgdesc='Native replacement for the Steam runtime using system libraries'
arch=('x86_64')
url='https://wiki.archlinux.org/index.php/Steam/Troubleshooting#Native_runtime'
license=('None')
replaces=('steam-libs')
depends=(
  'bash' 'steam' 'alsa-lib' 'alsa-plugins' 'atk' 'cairo' 'curl' 'dbus-glib' 'fontconfig'
  'freetype2' 'freeglut' 'gdk-pixbuf2' 'glew1.10' 'glib2' 'glu' 'gtk2'
  'lib32-alsa-lib' 'lib32-alsa-plugins' 'lib32-atk' 'lib32-cairo' 'lib32-curl'
  'lib32-dbus-glib' 'lib32-fontconfig' 'lib32-freetype2' 'lib32-freeglut'
  'lib32-gdk-pixbuf2' 'lib32-glew1.10' 'lib32-glib2' 'lib32-glu' 'lib32-gtk2'
  'lib32-libcaca' 'lib32-libcanberra'
  'lib32-libcups' 'lib32-libcurl-compat' 'lib32-libcurl-gnutls' 'lib32-dbus'
  'lib32-libdrm' 'lib32-libgcrypt15' 'lib32-libice' 'lib32-libidn11'
  'lib32-libjpeg6' 'lib32-libnm' 'lib32-pipewire' 'lib32-libpng12' 'lib32-libpulse'
  'lib32-librtmp0' 'lib32-libsm' 'lib32-libtheora' 'lib32-libtiff4'
  'lib32-libudev0-shim' 'lib32-libusb' 'lib32-libva' 'lib32-libvdpau'
  'lib32-libvorbis' 'lib32-libvpx1.3' 'lib32-libxcomposite'
  'lib32-libxcursor' 'lib32-libxft' 'lib32-libxi' 'lib32-libxinerama'
  'lib32-libxmu' 'lib32-libxrandr' 'lib32-libxrender' 'lib32-libxtst'
  'lib32-libxxf86vm' 'lib32-nspr' 'lib32-openal'
  'lib32-openssl-1.1' 'lib32-pango' 'lib32-sdl' 'lib32-sdl2' 'lib32-sdl2_image'
  'lib32-sdl2_mixer' 'lib32-sdl2_ttf' 'lib32-sdl_image' 'lib32-sdl_mixer'
  'lib32-sdl_ttf' 'libcaca' 'libcanberra' 'libcups'
  'libcurl-compat' 'libcurl-gnutls' 'dbus' 'libdrm' 'libgcrypt15' 'libice'
  'libidn11' 'libjpeg6' 'libibus' 'libnm' 'libpng12' 'libpulse' 'librsvg' 'librtmp0'
  'libsm' 'libtheora' 'libtiff4' 'libudev0-shim' 'libusb' 'libva' 'libvdpau'
  'libvorbis' 'libvpx1.3' 'libxcomposite' 'libxcursor' 'libxft'
  'libxi' 'libxinerama' 'libxmu' 'libxrandr' 'libxrender' 'libxtst'
  'libxxf86vm' 'nspr' 'openal' 'openssl-1.1' 'pango' 'sdl' 'sdl2'
  'sdl2_image' 'sdl2_mixer' 'sdl2_ttf' 'sdl_image' 'sdl_mixer' 'sdl_ttf'
  'vulkan-icd-loader' 'vulkan-driver' 'lib32-vulkan-driver' 'lib32-vulkan-icd-loader'
  'lib32-libappindicator-gtk2' 'lib32-libindicator-gtk2' 'lib32-libdbusmenu-glib' 'lib32-libdbusmenu-gtk2'
)
source=(steam-native.sh)
sha512sums=('03e969de86a69b0d9d86508a0a0cdd13be7c0c63076f6bc77c3685839a6784e8041528f5a1e9bfcb51d27c6c9994fab591c7d70fc44cc4673a1384781433041b')

prepare() {
  cp /usr/share/applications/steam.desktop steam-native.desktop
  sed -r 's|(Name=Steam) \(Runtime\)|\1 (Native)|' -i steam-native.desktop
  sed -r 's|(/usr/bin/steam)-runtime|\1-native|' -i steam-native.desktop
  sed '/^Icon=.*/i StartupWMClass=Steam' -i steam-native.desktop
}

package() {
  install -Dm 644 steam-native.desktop -t "${pkgdir}/usr/share/applications"
  install -Dm 755 steam-native.sh "${pkgdir}/usr/bin/steam-native"

  install -d "${pkgdir}/usr/lib/steam"
  ln -sf /usr/lib/libcurl.so.3 "${pkgdir}/usr/lib/steam/libcurl.so.3"
  ln -sf /usr/lib/libcurl.so.4.2.0 "${pkgdir}/usr/lib/steam/libcurl.so.4"
  ln -sf /usr/lib/libcurl.so.4.2.0 "${pkgdir}/usr/lib/steam/libcurl.so.4.2.0"
  if [ "${CARCH}" == "x86_64" ]; then
    install -d "${pkgdir}/usr/lib32/steam"
    ln -sf /usr/lib32/libcurl.so.3 "${pkgdir}/usr/lib32/steam/libcurl.so.3"
    ln -sf /usr/lib32/libcurl.so.4.2.0 "${pkgdir}/usr/lib32/steam/libcurl.so.4"
    ln -sf /usr/lib32/libcurl.so.4.2.0 "${pkgdir}/usr/lib32/steam/libcurl.so.4.2.0"
  fi
}

# vim: ts=2 sw=2 et:
