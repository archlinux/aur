# Maintainer: Agustin Ferrario "py_crash < agustin dot ferrario at hotmail dot com dot ar >
# Contributor: Luis von Bernus <PaterSiul@gmail.com>
# Contributors: L43y, aeosynth, Dan Serban, Kalipath

_name=firefox
_channel=aurora
_milestone=51.0a2
pkgname="${_name}-${_channel}"
pkgver=51.0a2.20161012004014
pkgrel=1
pkgdesc="Firefox Aurora channel - Nightly build"
url="http://www.mozilla.org/en-US/${_name}/${_channel}/"
arch=('i686' 'x86_64')
license=('MPL' 'GPL' 'LGPL')
depends=('gtk3' 'libxt' 'startup-notification' 'mime-types' 'dbus-glib'
	 'alsa-lib' 'dbus-glib' 'libnotify' 'desktop-file-utils' 'hicolor-icon-theme'
	 'libvpx' 'libevent' 'nss>=3.14.1' 'hunspell')
install="${pkgname}.install"

_baseurl="https://ftp.mozilla.org/pub/firefox/nightly/latest-mozilla-aurora"
_basename="${_name}-${_milestone}.en-US.linux"

source=("${pkgname}.desktop"
        "${pkgname}-safe.desktop")
#        'https://ftp.mozilla.org/pub/firefox/nightly/latest-mozilla-aurora/firefox-49.0a2.en-US.linux-x86_64.tar.bz2')

source_x86_64=('https://ftp.mozilla.org/pub/firefox/nightly/latest-mozilla-aurora/firefox-51.0a2.en-US.linux-x86_64.tar.bz2')
source_i686=('https://ftp.mozilla.org/pub/firefox/nightly/latest-mozilla-aurora/firefox-51.0a2.en-US.linux-i686.tar.bz2')
#source_x86_64=("${_baseurl}/${_basename}-x86_64.tar.bz2")
#source_i686=("${_baseurl}/${_basename}-i686.tar.bz2")
# "${_baseurl}/${_filename}.checksums"

sha512sums=('c3ed6811fcc6b2b3697420acb258b1bb37a54b24d48914e40ef03b044f0e2a14b9501d2e788af6622704410b74720f4bc585fe2bc29d9d487c8347aa4d408529'
            '06db4df1dd25c78d59f84831d1a48278a85d9ddbe7e2a494340dc0ef9e192f7c67eff57e2962eb084c55eda6bf9e5e3f09dd962dce56878e4ae3583c2f219389')
#    'SKIP')

sha512sums_i686=('67938fd1be3bc8da9601540e4f8571cf6e361e8dc226622cc359473c0287086801ece27794b8e7de80f8bb77a836694f7535f879d8f319989b2a41439ae47a0c')
sha512sums_x86_64=('6eed11e34186fdc99cf9e16b7f90d4479bab742bb0770619e18082c129b1b59e3cc57689ddcb38fe58296ddc2d403fde235ba72374eb71f39b2d2f65c395cd81')

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
