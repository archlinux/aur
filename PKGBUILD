# Maintainer: Hybrid Glucose <a07051226@gmail.com>

_name=firefox
_channel=aurora
_milestone=53.0a2
_lang=zh-tw
pkgname="${_name}-${_channel}-${_lang}"
pkgver=53.0a2.20170218084110
pkgrel=1
pkgdesc="Chinese Traditional For Firefox Developer (Aurora-l10n)"
url="http://www.mozilla.org/zh-TW/${_name}/${_channel}/"
arch=('i686' 'x86_64')
license=('MPL' 'GPL' 'LGPL')
depends=('gtk3' 'libxt' 'startup-notification' 'mime-types' 'dbus-glib'
	 'alsa-lib' 'dbus-glib' 'libnotify' 'desktop-file-utils' 'hicolor-icon-theme'
	 'libvpx' 'libevent' 'nss>=3.14.1' 'hunspell')

install="${pkgname}.install"

_baseurl="https://ftp.mozilla.org/pub/firefox/nightly/latest-mozilla-aurora-l10n"
_filename="${_name}-${_milestone}.zh-TW.linux-${CARCH}"
_sha512sum="$(curl -vs "${_baseurl}/${_filename}.checksums" 2>&1 | grep "${_filename}.tar.bz2" | grep sha512 | cut -d " " -f1)"
source=("${pkgname}.desktop"
	"${pkgname}-safe.desktop"
	"${_baseurl}/${_filename}.tar.bz2"
       )

sha512sums=('4c1284e97f26c7ad7b8e39f32bb82c015ac3c7dbaf3b96192dc40d95994a5602cf4c449fd4becfaed75f6e00e0af3db226d318625e95030ae9d9ddcc86ee45f7'
            '53756ab2a009a96585fd7b2131bb7fddaef112da9af84da4513ed7f3cf507cee5571ccbba7efa3ef1c027c06d5c6d5f16612f7ec536791e828d68098a1413fcb'
            # "${_sha512sum}"
            'SKIP'
            )
pkgver() {
       cd "${_name}"
          echo "${_milestone}.$(cat platform.ini|grep BuildID|cut -d "=" -f2 )"
      }

package() {
  install -d "$pkgdir"/{usr/bin,opt}
  mv "${_name}" "${pkgdir}/opt/${pkgname}"
  ln -s "/opt/${pkgname}/${_name}" "${pkgdir}/usr/bin/${pkgname}"
  install -Dm644 "${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
  install -Dm644 "${pkgname}-safe.desktop" "${pkgdir}/usr/share/applications/${pkgname}-safe.desktop"
  install -Dm644 "${pkgdir}/opt/${pkgname}/browser/icons/mozicon128.png" \
  		 "${pkgdir}/usr/share/pixmaps/${pkgname}-icon.png"
}

