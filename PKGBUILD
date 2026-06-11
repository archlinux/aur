# Maintainer: TrueConf LLC <packager@trueconf.com>

pkgbase='trueconf-client'
pkgname='trueconf'
pkgver=8.6.0.1248
pkgrel='1'
pkgdesc='TrueConf for Linux is a video conferencing app with advanced collaboration tools and user-friendly UI. All you need to get started is any PC or laptop with an Internet connection.'
arch=('x86_64')
url='https://trueconf.com'
mirror='https://packages.trueconf.ru/archlinux'
license=('custom:trueconf')
depends=('freetype2' 'lame' 'libidn' 'speex' 'v4l-utils' 'libxext' 'libx11' 'libxcb'
         'libxrandr' 'libxdamage' 'libxcomposite' 'libxtst' 'libxss' 'libxcursor'
         'libxkbcommon' 'libxkbcommon-x11' 'alsa-lib' 'hunspell' 'gsl' 'libmfx'
         'libva' 'opencv' 'c-ares' 'avahi' 'nss' 'xcb-util-wm' 'xcb-util-keysyms'
         'xcb-util-image' 'xcb-util-renderutil' 'double-conversion' 'gtk3' 'lshw'
         'qt6-base' 'qt6-multimedia' 'qt6-svg' 'qt6-webengine' 'qt6-tools' 'qt6-shadertools'
        )
install="${pkgname}.install"
_channel=stable
source=("$mirror/$pkgname-$pkgver-$pkgrel-$arch.pkg.tar.zst")
sha512sums=('27fdde336741eca8a8cd0b3417c40f8832a1436bfe28b526bea9bd1f0c71a9c8c74b37b1641cba62b428d29ebf60a85d6df809c456b4c219d9cb50f4365059fb')

package() {
  cd "${srcdir}"
  install -Dm 755 "${srcdir}/opt/${pkgname}/client/TrueConf" "${pkgdir}/opt/${pkgname}/client/TrueConf"
  install -Dm 755 "${srcdir}/opt/${pkgname}/client/${pkgname}" "${pkgdir}/opt/${pkgname}/client/${pkgname}"
  install -Dm 755 "${srcdir}/opt/${pkgname}/client/${pkgname}-autostart" "${pkgdir}/opt/${pkgname}/client/${pkgname}-autostart"
  install -Dm 644 "${srcdir}/opt/${pkgname}/client/${pkgname}_client-autostart.desktop" "${pkgdir}/opt/${pkgname}/client/${pkgname}_client-autostart.desktop"
  install -Dm 644 "${srcdir}/usr/share/metainfo/${pkgname}.appdata.xml" "${pkgdir}/usr/share/metainfo/${pkgname}.appdata.xml"
  install -Dm 644 "${srcdir}/usr/share/applications/${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
  install -Dm 644 "${srcdir}/usr/share/pixmaps/${pkgname}.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
  install -Dm 644 "${srcdir}/usr/share/pixmaps/${pkgname}16.png" "${pkgdir}/usr/share/pixmaps/${pkgname}16.png"
  #libs
  install -m755 -d "${pkgdir}/opt/${pkgname}/client/lib"
  cp -r "${srcdir}/opt/${pkgname}/client/lib/"* "${pkgdir}/opt/${pkgname}/client/lib"
  #fonts
  install -m755 -d "${pkgdir}/opt/${pkgname}/client/fonts"
  cp -r "${srcdir}/opt/${pkgname}/client/fonts/"* "${pkgdir}/opt/${pkgname}/client/fonts"
  #model
  install -m755 -d "${pkgdir}/opt/${pkgname}/client/model"
  cp -r "${srcdir}/opt/${pkgname}/client/model/"* "${pkgdir}/opt/${pkgname}/client/model"
  #dictionaries
  install -m755 -d "${pkgdir}/opt/${pkgname}/client/dictionaries"
  cp -r "${srcdir}/opt/${pkgname}/client/dictionaries/"* "${pkgdir}/opt/${pkgname}/client/dictionaries"
  #icons
  names=(
    busy
    missed
    not-connected
    offline
    online
    tray-away
    tray-dnd
    unread
  )
  for i in 22x22 24x24 32x32 48x48 64x64; do
    for x in ${!names[*]}; do
      install -Dm 644 "${srcdir}/usr/share/icons/hicolor/$i/status/${pkgname}-${names[$x]}.png" \
        "${pkgdir}/usr/share/icons/hicolor/$i/status/${pkgname}-${names[$x]}.png"
    done
  done
}
