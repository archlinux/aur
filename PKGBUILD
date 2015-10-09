# Maintainer: Cedric MATHIEU <me.xenom @ gmail.com>
# Contributor : Det <nimetonmaili @ gmail.com>
# Contributor: coderoar <coderoar @ gmail.com>
# Contributor: kang <kang @ mozilla.com>
# Contributor: John Reese <jreese @ noswap.com>

_name=firefox
_channel=nightly
pkgname="${_name}-${_channel}"
pkgname=firefox-nightly
pkgdesc='Standalone web browser from mozilla.org, nightly build'
url='http://www.mozilla.org/projects/firefox'
pkgver=44.0a1.20150928
_version=44.0a1
pkgrel=2
arch=('i686' 'x86_64')
license=('MPL' 'GPL' 'LGPL')
_file="${_name}-${_version}.en-US.linux"
_srcurl="https://ftp.mozilla.org/pub/mozilla.org/firefox/nightly/latest-trunk"
source=('firefox-nightly.desktop' 'firefox-nightly-safe.desktop' 'vendor.js')
source_i686=("${_srcurl}/${_file}-i686.tar.bz2" "${_srcurl}/${_file}-i686.txt")
source_x86_64=("${_srcurl}/${_file}-x86_64.tar.bz2" "${_srcurl}/${_file}-x86_64.txt")
_srcsum_i686="$(curl -s "${_srcurl}/${_file}-i686.checksums" | grep "${_file}-i686.tar.bz2" | grep sha512 | cut -d " " -f1)" 
_srcsum_x86_64="$(curl -s "${_srcurl}/${_file}-x86_64.checksums" | grep "${_file}-x86_64.tar.bz2" | grep sha512 | cut -d " " -f1)" 
sha512sums=('2d8feaf128775efbab958e2614613cd45a7a172a3c687b6af054d61eabd3592cf1dd1c85ca92bff82834f43eb7ebedeb4f8c2fe6f116b6a22eb14a7ff98a1f25' '88510ea986776bb8ed9fc8c1217728f8cf0f8b3a8aa4dbc07608e7b2803cd13dcb6809363208fd9531ccee5a9ba2cee39af498a1279d3e1268511982ecb559ec' 'bae5a952d9b92e7a0ccc82f2caac3578e0368ea6676f0a4bc69d3ce276ef4f70802888f882dda53f9eb8e52911fb31e09ef497188bcd630762e1c0f5293cc010')
sha512sums_i686=("${_srcsum_i686}" 'SKIP')
sha512sums_x86_64=("${_srcsum_x86_64}" 'SKIP')
depends=('alsa-lib' 'libxt' 'libnotify' 'mime-types' 'nss' 'gtk2' 'gtk3' 'sqlite' 'dbus-glib')

pkgver() {
	echo "${_version}.$(date +%Y%m%d)"
}

package() {
  
  # uncomment these lines to enable GnuPG signature verification. You'll need Firefox's GnuPG release key.
  # Their current fingerprint (2015-07-17) is 14F2 6682 D091 6CDD 81E3 7B6D 61B7 B526 D98F 0353
  #msg "Verifying GnuPG signature..."
  # Add your architecture here (i686 or x86_64)
  #CARCH=
  #FX_GPG="${_file}-${CARCH}.checksums.asc"
  #FX_GPG_URI="${_srcurl}/${FX_GPG}"
  #FX_CHKSUM_URI="${_srcurl}/${_file}-${CARCH}.checksums"
  #curl -OR ${FX_CHKSUM_URI}
  #curl -OR ${FX_GPG_URI} 
  #gpg --verify ${FX_GPG} 

  #  uncomment this line to remove these
  #  rm -rf firefox/{extensions,plugins,searchplugins}
  install -d "${pkgdir}"/{usr/{bin,share/{applications,pixmaps}},opt}
  cp -r firefox "${pkgdir}/opt/firefox-${_version}"

  ln -s /opt/firefox-${_version}/firefox "${pkgdir}/usr/bin/firefox-nightly"
  install -m644 "${srcdir}"/{firefox-nightly.desktop,firefox-nightly-safe.desktop} "${pkgdir}/usr/share/applications/"
  install -m644 "${srcdir}/firefox/browser/icons/mozicon128.png" "${pkgdir}/usr/share/pixmaps/${pkgname}-icon.png"
  install -Dm644 "${srcdir}/vendor.js" "${pkgdir}/opt/firefox-${_version}/browser/defaults/preferences/vendor.js"
}
