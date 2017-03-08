# Maintainer: Alex Talker <alextalker at opemailbox dot org>
# Contributor: Luis von Bernus <PaterSiul@gmail.com>
# Contributors: L42y, aeosynth, Dan Serban, Kalipath

_name=firefox
_channel=aurora
_milestone=54.0a2
_lang=ru

_release_year=2017
_release_month=03
_release_day=08
_release_time=$_release_year-$_release_month-$_release_day-08-47-51
_buildid=20170308084751

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

sha512sums_i686=('2eb7630da47924b55a389157e2320f31a36679168d0a3e0fd5049cb5b75b10cabb7b9ec85ff8aeee1a642b2b50b1b3663d418b81a30c6d928c81b360bedbc56d')
sha512sums_x86_64=('82a01392e2260685926863797990507247510a6a6bbed13c0ce8c170058911e5e4964cd9f53830dd1afe4e768402c5a7ea6e7da5519d4ec687bda3e30f6ec3d9')

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
