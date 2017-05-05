# Maintainer: Alex Talker <alextalker at opemailbox dot org>
# Contributor: Luis von Bernus <PaterSiul@gmail.com>
# Contributors: L42y, aeosynth, Dan Serban, Kalipath

_name=firefox
_channel=aurora
_milestone=54.0a2
_lang=ru

_release_year=2017
_release_month=05
_release_day=05
_release_time=$_release_year-$_release_month-$_release_day-07-49-38
_buildid=20170505074938

pkgname="${_name}-${_channel}-${_lang}"
_pkgname="${_name}-${_channel}"
pkgver=54.0a2.$_buildid
pkgrel=1

pkgdesc="Firefox Aurora channel - Nightly build"
license=('MPL' 'GPL' 'LGPL')
url="http://www.mozilla.org/en_US/${_name}/${_channel}/"

arch=('i686' 'x86_64')
depends=('gtk3' 'libxt' 'startup-notification' 'mime-types' 'dbus-glib' 
	 'alsa-lib' 'dbus-glib' 'libnotify' 'desktop-file-utils' 'hicolor-icon-theme'
	 'libvpx' 'libevent' 'nss>=3.14.1' 'hunspell')

provides=('firefox-aurora' "firefox-aurora-${_lang}")
conflicts=('firefox-aurora')
install="${_pkgname}.install"

source=("${_pkgname}.desktop"
        "${_pkgname}-safe.desktop")

_base_url="http://ftp.mozilla.org/pub/firefox/nightly/$_release_year/$_release_month/$_release_time-mozilla-aurora-l10n"
source_x86_64=("$_base_url/firefox-54.0a2.$_lang.linux-x86_64.tar.bz2")
source_i686=("$_base_url/firefox-54.0a2.$_lang.linux-i686.tar.bz2")

sha512sums=('1c0eef1129625ecfb70809dbb9ab764054d1680f05b7807f503145b5889bc42babb268cb4e2b7b102f90c50cc249114f773d91992e9ac41b5a6966e3b5c95675'
            '749bc9bb180909c7319a1576e9df1e4cb06488b33b8dd61b8f1a63e4df9208cb9bb6d0c4ecef3fbe388f78368aef4562ae1dbfda1dbbfa649aa9d247c4903610')

sha512sums_i686=('ceb18e594ffeb862cdf4862d8f73a44559ca7b469e78ca94c7a5535edff8008d29948d2a79ebe707c816a729dacf460c8cc02b0a195f8fa60340599b37a75c0f')
sha512sums_x86_64=('731d9aad3ef1629731cf8707f4ea5a5c2c543056b8cf2924af44192b7eaf7b04d5e4a138e1fd0bc3c4153af3b74ec2528a7b16776b4d60ea18d498099c56107a')

pkgver() {
  cd "${_name}"
  echo "${_milestone}.$(cat platform.ini|grep BuildID|cut -d "=" -f2 )"
}

package() {
  _subname=${_name}-${_channel}

  install -d "${pkgdir}"/{usr/bin,opt}
  mv    "${_name}"                  "${pkgdir}/opt/${_subname}"
  ln -s "/opt/${_subname}/${_name}" "${pkgdir}/usr/bin/${_subname}"

  install -Dm644 "${_subname}.desktop" \
                 "${pkgdir}/usr/share/applications/${_subname}.desktop"

  install -Dm644 "${_subname}-safe.desktop" \
                 "${pkgdir}/usr/share/applications/${_subname}-safe.desktop"

  install -Dm644 "${pkgdir}/opt/${_subname}/browser/icons/mozicon128.png" \
                 "${pkgdir}/usr/share/pixmaps/${_subname}-icon.png"
}
