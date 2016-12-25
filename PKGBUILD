# Maintainer: Alex Talker <alextalker at opemailbox dot org>
# Contributor: Luis von Bernus <PaterSiul@gmail.com>
# Contributors: L42y, aeosynth, Dan Serban, Kalipath

_name=firefox
_channel=aurora
_milestone=52.0a2
_lang=ru

_release_year=2016
_release_month=12
_release_day=25
_release_time=$_release_year-$_release_month-$_release_day-00-40-04
_buildid=20161225004004

pkgname="${_name}-${_channel}-${_lang}"
_pkgname="${_name}-${_channel}"
pkgver=52.0a2.$_buildid
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
source_x86_64=("$_base_url/firefox-52.0a2.$_lang.linux-x86_64.tar.bz2")
source_i686=("$_base_url/firefox-52.0a2.$_lang.linux-i686.tar.bz2")

sha512sums=('1c0eef1129625ecfb70809dbb9ab764054d1680f05b7807f503145b5889bc42babb268cb4e2b7b102f90c50cc249114f773d91992e9ac41b5a6966e3b5c95675'
            '749bc9bb180909c7319a1576e9df1e4cb06488b33b8dd61b8f1a63e4df9208cb9bb6d0c4ecef3fbe388f78368aef4562ae1dbfda1dbbfa649aa9d247c4903610')

sha512sums_i686=('84565d16c4b3f0b18f8074bc07bf708f92a8e6254da3eb04fe705af9196992d3c6e52ec9b37dbe44848fa29d41a5e19f37fa2a8cd4d52bf8d86940ad12d21dbf')
sha512sums_x86_64=('b62d34ff9945d64b5f51880b1bc879c54ff6ea2e6019da1ef0939fae56f939a8fa5b14a84ff3b277ff29b8f5c709a64edf16e242d2fc23721ef624386a3133de')

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
