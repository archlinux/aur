# Maintainer: Agustin Ferrario "py_crash < agustin dot ferrario at hotmail dot com dot ar >
# Contributor: Luis von Bernus <PaterSiul@gmail.com>
# Contributors: L43y, aeosynth, Dan Serban, Kalipath

_name=firefox
_channel=aurora
_milestone=51.0a2
pkgname="${_name}-${_channel}"
pkgver=51.0a2.20161021004016
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

sha512sums_i686=('93579b65f9e9d835e9a94ff678c9da8db7206bd2c883c8cecaf568f1ec46a7bf4a529c710c6b472655ca22ce4f509d5d10bc9e506522d19efcb1eaeb79ea655a')
sha512sums_x86_64=('2e8bf72a4bd46219a67d858c609fe1f6f960952e10d0578890163d208c33e0ed7f5eb8d56bbc1c148438974612cdec11fa8809ca98fe9cc75ac04ea3c713c4f8')

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
