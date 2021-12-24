# Maintainer: TrueConf LLC <packager@trueconf.com>
pkgbase='trueconf-client'
pkgname='trueconf'
pkgver='8.0.1.263'
pkgrel='1'
pkgdesc='Video conference client with a range of rich collaborative tools and an easy-to-use interface'
arch=('x86_64')
url="https://trueconf.com"
license=('custom:trueconf')
depends=('pulseaudio'
         'alsa-utils'
         'bzip2'
         'curl'
         'dbus'
         'openssl'
         'glib2'
         'icu'
         'lame'
         'libglvnd'
         'libidn'
         'libphonenumber'
         'libsystemd'
         'libx11'
         'ghostscript'
         'libxcb'
         'libxext'
         'libxrandr'
         'protobuf'
         'qt5-base'
         'qt5-multimedia'
         'qt5-svg'
         'qt5-webkit'
         'qt5-webview'
         'qt5-webengine'
         'qt5-webchannel'
         'qt5-declarative'
         'qt5-quickcontrols'
         'qt5-quickcontrols2'
         'qt5-graphicaleffects'
         'libxss'
         'speex'
         'speexdsp'
         'sqlite'
         'v4l-utils'
         'zlib'
         'systemd'
)
install="${pkgname}-client.install"
_channel=stable
source=("${url}/download/${pkgname}_client_arch_x86_64.pkg.tar.zst")
sha512sums=('2bce8506fe82df31ca058c6ae8d9c69b0c48789a4f5a1c6df5ec62155a3fa9b79920a27460bc7531801a59db04387740c1df47cd4dafef66a45d313a0d52c079')

package() {
  cd "${srcdir}"
  install -Dm 755 "${srcdir}/opt/${pkgname}/TrueConf" "${pkgdir}/opt/${pkgname}/TrueConf"
  install -Dm 755 "${srcdir}/opt/${pkgname}/${pkgname}-client" "${pkgdir}/opt/${pkgname}/${pkgname}-client"
  install -Dm 755 "${srcdir}/opt/${pkgname}/${pkgname}-client-autostart" "${pkgdir}/opt/${pkgname}/${pkgname}-client-autostart"
  install -Dm 644 "${srcdir}/opt/${pkgname}/${pkgname}.desktop" "${pkgdir}/opt/${pkgname}/${pkgname}.desktop"
  install -Dm 644 "${srcdir}/opt/${pkgname}/${pkgname}-autostart.desktop" "${pkgdir}/opt/${pkgname}/${pkgname}-autostart.desktop"
  install -Dm 644 "${srcdir}/usr/share/appdata/${pkgname}.appdata.xml" "${pkgdir}/usr/share/appdata/${pkgname}.appdata.xml"
  install -Dm 644 "${srcdir}/usr/share/applications/${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
  install -Dm 644 "${srcdir}/usr/share/menu/${pkgname}" "${pkgdir}/usr/share/menu/${pkgname}"
  install -Dm 644 "${srcdir}/usr/share/pixmaps/${pkgname}.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
  install -Dm 644 "${srcdir}/usr/share/pixmaps/${pkgname}16.png" "${pkgdir}/usr/share/pixmaps/${pkgname}16.png"
  #libs
  install -m755 -d "${pkgdir}/opt/${pkgname}/lib"
  cp -r "${srcdir}/opt/${pkgname}/lib/"* "${pkgdir}/opt/${pkgname}/lib"
  #fonts
  install -m755 -d "${pkgdir}/opt/${pkgname}/fonts"
  cp -r "${srcdir}/opt/${pkgname}/fonts/"* "${pkgdir}/opt/${pkgname}/fonts"
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
