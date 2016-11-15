# Maintainer: Agustin Ferrario "py_crash < agustin dot ferrario at hotmail dot com dot ar >
# Contributor: Luis von Bernus <PaterSiul@gmail.com>
# Contributors: L43y, aeosynth, Dan Serban, Kalipath

_name=firefox
_channel=aurora
_milestone=52.0a2

_release_year=2016
_release_month=11
_release_day=15
_release_time=$_release_year-$_release_month-$_release_day-00-40-18
_buildid=20161115004018

pkgname="${_name}-${_channel}"
pkgver=52.0a2.$_buildid
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
source_x86_64=("$_base_url/firefox-52.0a2.en-US.linux-x86_64.tar.bz2")
source_i686=("$_base_url/firefox-52.0a2.en-US.linux-i686.tar.bz2")

sha512sums=('c3ed6811fcc6b2b3697420acb258b1bb37a54b24d48914e40ef03b044f0e2a14b9501d2e788af6622704410b74720f4bc585fe2bc29d9d487c8347aa4d408529'
            '06db4df1dd25c78d59f84831d1a48278a85d9ddbe7e2a494340dc0ef9e192f7c67eff57e2962eb084c55eda6bf9e5e3f09dd962dce56878e4ae3583c2f219389')

sha512sums_i686=('e12d232510170eda54b9789e39be2807b0dcb125be20fa156a1004bbca0f699842f9012f50a186e7ce16f3573d42c46633f083f00a7840cbcd721c580cf22d14')
sha512sums_x86_64=('3c1ae01b0640513fa90a7be57d3245e6fa05bf0e7b4dd7d9b9027da64c1f2a5e801f4c1bece86936d6068c6b1a9db7ad504b571fac30cca8ad3fba0686cd5850')

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
