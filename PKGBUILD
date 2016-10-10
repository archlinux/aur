# Maintainer: Alex Talker <alextalker at opemailbox dot org>
# Contributor: Luis von Bernus <PaterSiul@gmail.com>
# Contributors: L42y, aeosynth, Dan Serban, Kalipath
_name=firefox
_channel=aurora
_milestone=51.0a2
_lang=ru
pkgname="${_name}-${_channel}-${_lang}"
_pkgname="${_name}-${_channel}"
pkgver=51.0a2.20161009004008
pkgrel=1
pkgdesc="Firefox Aurora channel - Nightly build"
url="http://www.mozilla.org/en_US/${_name}/${_channel}/"
arch=('i686' 'x86_64')
license=('MPL' 'GPL' 'LGPL')
depends=('gtk3' 'libxt' 'startup-notification' 'mime-types' 'dbus-glib' 
	 'alsa-lib' 'dbus-glib' 'libnotify' 'desktop-file-utils' 'hicolor-icon-theme'
	 'libvpx' 'libevent' 'nss>=3.14.1' 'hunspell')
provides=('firefox-aurora' "firefox-aurora-${_lang}")
conflicts=('firefox-aurora')
install="${_pkgname}.install"

source=("${_pkgname}.desktop"
        "${_pkgname}-safe.desktop")

source_i686=('https://ftp.mozilla.org/pub/firefox/nightly/latest-mozilla-aurora-l10n/firefox-51.0a2.ru.linux-i686.tar.bz2')
source_x86_64=('https://ftp.mozilla.org/pub/firefox/nightly/latest-mozilla-aurora-l10n/firefox-51.0a2.ru.linux-x86_64.tar.bz2')

sha512sums=('1c0eef1129625ecfb70809dbb9ab764054d1680f05b7807f503145b5889bc42babb268cb4e2b7b102f90c50cc249114f773d91992e9ac41b5a6966e3b5c95675'
            '749bc9bb180909c7319a1576e9df1e4cb06488b33b8dd61b8f1a63e4df9208cb9bb6d0c4ecef3fbe388f78368aef4562ae1dbfda1dbbfa649aa9d247c4903610')

sha512sums_i686=('b2094edcf8635d700a1e1421561330a6ad9c5f0b3cf4d5a391410c3cfb4276edd563b838a1d75575b1bbec4314af6b3ded314da38fc0cb81ccc94ffba65c131d')
sha512sums_x86_64=('2d9322222b0328c3aed731d06d32dcbe05cb5e2d500f5a9f407b7262e8d1df674fba99a59ab64a829b1ab6ae0cb60344fd1229afb06798b8e078cfb0027b897d')

pkgver() {
  cd "${_name}"
  echo "${_milestone}.$(cat platform.ini|grep BuildID|cut -d "=" -f2 )"
}

package() {
  _subname=${_name}-${_channel}
  install -d "${pkgdir}"/{usr/bin,opt}
  mv "${_name}" "${pkgdir}/opt/${_subname}"
  ln -s "/opt/${_subname}/${_name}" "${pkgdir}/usr/bin/${_subname}"
  install -Dm644 "${_subname}.desktop" "${pkgdir}/usr/share/applications/${_subname}.desktop"
  install -Dm644 "${_subname}-safe.desktop" "${pkgdir}/usr/share/applications/${_subname}-safe.desktop"
  install -Dm644 "${pkgdir}/opt/${_subname}/browser/icons/mozicon128.png" \
  		 "${pkgdir}/usr/share/pixmaps/${_subname}-icon.png"
}
