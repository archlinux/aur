# Maintainer: py_crash <agustin.ferrario@hotmail.com.ar>
# Based on kang's thunderbird-aurora
pkgname=thunderbird-earlybird
_name=thunderbird
_channel=earlybird
_milestone=51.0a2
pkgver=51.0a2.20161005004014
pkgrel=1
pkgdesc="Standalone Mail/News reader - Earlybird channel"
arch=('i686' 'x86_64')
license=('MPL' 'GPL' 'LGPL')
url="http://www.mozilla.org/${_name}/channel"
depends=('alsa-lib' 'cairo' 'dbus-glib' 'desktop-file-utils' 'fontconfig' 
          'freetype2' 'gtk3' 'hicolor-icon-theme' 'hunspell' 'libevent'
          'libjpeg' 'libmng' 'libpng' 'libvpx' 'libxt' 'mozilla-common'
          'nspr' 'nss' 'shared-mime-info' 'sqlite3' 'startup-notification')
optdepends=('libcanberra: for sound support')
replaces=("${_name}-aurora")
install="${pkgname}.install"

source=("${pkgname}.desktop")

source_i686=('https://ftp.mozilla.org/pub/thunderbird/nightly/latest-comm-aurora/thunderbird-51.0a2.en-US.linux-i686.tar.bz2')
source_x86_64=('https://ftp.mozilla.org/pub/thunderbird/nightly/latest-comm-aurora/thunderbird-51.0a2.en-US.linux-x86_64.tar.bz2')

sha512sums=('a36bb5710b9cd6637cf6f538808e2fba8c99fdd1d486446ff9ee8094ca30b5592c17b3e808cae1da7ff2b28123f54902ed4ee1501585a8dcfc54d581588638d3')
sha512sums_i686=('823fe5c97960271a300a368f26228afac47a23c48e591b326c8994d6f7a883255cd6b26b5ee8a10b0a5b1de64f5d69d5f7cdcbddcabbe937cf0d58d6349f0809')
sha512sums_x86_64=('9c04cab68a7eb08d63187df3808f9f5631e701e817d756e706e9739ece299e2f87d7de2afc7ef94997752461eeb955666353a721a63949dbb1b9673eab9553a0')

pkgver() {
    cd "${_name}"
    echo "${_milestone}.$(cat platform.ini|grep BuildID|cut -d "=" -f2 )"
}

package() {
  install -d "${pkgdir}"/{usr/bin,opt}
  cp -a ${_name} "${pkgdir}/opt/${pkgname}"
  ln -s /opt/${pkgname}/${_name} "${pkgdir}/usr/bin/${pkgname}"
  for i in 16x16 22x22 24x24 32x32 48x48 256x256; do
    install -Dm644 ${_name}/chrome/icons/default/default${i/x*/}.png "${pkgdir}/usr/share/icons/hicolor/${i}/apps/${pkgname}.png"
  done
  install -Dm644 ${pkgname}.desktop "${pkgdir}/usr/share/applications/${pkgname}.desktop"
  rm -rf "${pkgdir}/opt/${pkgname}/dictionaries"
  ln -sf /usr/share/hunspell "${pkgdir}/opt/${pkgname}/dictionaries"
}
