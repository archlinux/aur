# Maintainer: Hybrid Glucose <a07051226@gmail.com>

_name=firefox
_channel=aurora
_milestone=49.0a2
_lang=zh-tw
pkgname="${_name}-${_channel}-${_lang}"
pkgver=49.0a2.20160617004051
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
_filename="${_name}-${_milestone}.${_lang}.linux-${CARCH}"
_sha512sum="$(curl -vs "${_baseurl}/${_filename}.checksums" 2>&1 | grep "${_filename}.tar.bz2" | grep sha512 | cut -d " " -f1)"
source=("${pkgname}.desktop"
	"${pkgname}-safe.desktop"
	"${_baseurl}/${_filename}.tar.bz2")

sha512sums=('f790fea8ae8fb0201a36ef8600f1ec2319b5a574192d510d5c981b20c0082e1be6d9bad7491ad4fc51e26193da22ea894365cbbbe26810e0921a7c07691ea39c'
            '0248804f539d8733658e68d2eba6ab51d886e4cb30a72da63b14a6277d950dc43ca8c12952e8612fb527b03cc31d9d05211010202ede432a9b17e6e18883111c'
            "${_sha512sum}")
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

