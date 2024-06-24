# Maintainer: TrueConf LLC <packager@trueconf.com>
pkgbase='trueconf-client'
pkgname='trueconf'
pkgver='8.4.1.658'
pkgrel='1'
pkgdesc='Video conference client with a range of rich collaborative tools and an easy-to-use interface'
arch=('x86_64')
url='https://trueconf.com'
mirror='https://mirror.trueconf.com/archlinux'
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
         'qt5-webview'
         'qt5-webengine'
         'qt5-webchannel'
         'qt5-declarative'
         'c-ares'
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
         'intel-media-sdk'
         'gsl'
         'krb5'
         'double-conversion'
         'boost-libs'
         'libxcomposite'
         'libxdamage'
         'libxfixes'
)
install="${pkgname}-client.install"
_channel=stable
source=('https://mirror.trueconf.com/archlinux/trueconf-8.4.1.658-1-x86_64.pkg.tar.zst')
sha512sums=('382b55f1b7b539ba94e2533f6a3ba43ae1c7b2440eb0f75cfaa23bf3deb638a69d5065f0d294c88c4f60544e48cefbc597435e9d4de1efd68beb007177b23525')

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
