# Maintainer: Agustin Ferrario "py_crash < agustin dot ferrario at hotmail dot com dot ar >
# Contributor: Luis von Bernus <PaterSiul@gmail.com>
# Contributors: L43y, aeosynth, Dan Serban, Kalipath

_name=firefox
_channel=aurora
_milestone=54.0a2

_release_year=2017
_release_month=04
_release_day=19
_release_time=$_release_year-$_release_month-$_release_day-07-47-07
_buildid=20170419074707

pkgname="${_name}-${_channel}"
pkgver=54.0a2.$_buildid
pkgrel=1
pkgdesc="Firefox Aurora channel - Nightly build"
url="http://www.mozilla.org/en-US/${_name}/${_channel}/"
arch=('i686' 'x86_64')
license=('MPL' 'GPL' 'LGPL')
depends=('gtk3' 'libxt' 'startup-notification' 'mime-types' 'dbus-glib'
	 'alsa-lib' 'dbus-glib' 'libnotify' 'desktop-file-utils' 'hicolor-icon-theme'
	 'libvpx' 'libevent' 'nss>=3.14.1' 'hunspell')
install="${pkgname}.install"

source=("${pkgname}.desktop"
        "${pkgname}-safe.desktop")

_base_url="http://ftp.mozilla.org/pub/firefox/nightly/$_release_year/$_release_month/$_release_time-mozilla-aurora"
source_x86_64=("$_base_url/firefox-54.0a2.en-US.linux-x86_64.tar.bz2")
source_i686=("$_base_url/firefox-54.0a2.en-US.linux-i686.tar.bz2")

sha512sums=('c3ed6811fcc6b2b3697420acb258b1bb37a54b24d48914e40ef03b044f0e2a14b9501d2e788af6622704410b74720f4bc585fe2bc29d9d487c8347aa4d408529'
            '06db4df1dd25c78d59f84831d1a48278a85d9ddbe7e2a494340dc0ef9e192f7c67eff57e2962eb084c55eda6bf9e5e3f09dd962dce56878e4ae3583c2f219389')

sha512sums_i686=('8782197bd99d6002ae919ae58607227a18bc2db671fc388df498d87de53a25ec1087dcd04b4bfa5f72d6605b342e32a0a7370e2861d5a5f2937db03bb34f2a96')
sha512sums_x86_64=('680f6b2b7f61ded5458882ce3145b238394bbda6c07b4b4fe21761565738ebc52f6c0b3a5ea8f8ddaab7a41095794dc8931034f21d9fde592d9a41126337b10a')

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

_filename="${_name}-${_milestone}.en-US.linux-${CARCH}"
_pkg_hashsum(){
    cat ${_filename}.checksums 2>&1 | grep "${_filename}.tar.bz2" | grep sha512 | cut -d " " -f1
}
