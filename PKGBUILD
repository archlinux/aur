# Maintainer: vitamin1980 <vitamin.novgorod @ yandex.ru>
# Contributor: McModder <mcmodder @ mcmodder.ru>

pkgname=firefox-nightly-ru
pkgdesc='Web browser from mozilla.org, nightly build, russian version'
url='http://nightly.mozilla.org/'
pkgver=57.0a1
pkgrel=1
arch=('i686' 'x86_64')
license=('MPL' 'GPL' 'LGPL')
_filename="firefox-${pkgver}.ru.linux-${CARCH}"
_baseurl="https://ftp.mozilla.org/pub/mozilla.org/firefox/nightly/latest-mozilla-central-l10n"
_sha256sum="$(curl -vs "${_baseurl}/${_filename}.checksums" 2>&1 | grep bz | grep sha256 | cut -d " " -f1 | head -n 1)"
source=('firefox-nightly.desktop'
        'firefox-nightly-ru.install'
        'vendor.js'
        "${_baseurl}/${_filename}.tar.bz2")
sha256sums=('b4661a5f6f3c6ac2a6eea3a542ad7d965c6a2a5407335521c0acc7557c1ad0aa'
         '07aa620747e5b6c2ba564d360ebd00506edf6bec4474e14aa98953466af3dba5'
         'a605391acbcf6096f1db3c8c31c75bcacbe067dbb341a8b7529718dd246cd38e'
         "${_sha256sum}")
install=${pkgname}.install
depends=('alsa-lib' 'libxt' 'libnotify' 'mime-types' 'nss' 'gtk2' 'gtk3' 
'sqlite' 'dbus-glib' 'desktop-file-utils')
conflicts=('firefox-nightly')

package() {
  mkdir -p "${pkgdir}"/{usr/{bin,share/{applications,pixmaps}},opt}
  cp -r firefox "${pkgdir}/opt/firefox-nightly-ru"
  ln -s /opt/firefox-nightly-ru/firefox "${pkgdir}/usr/bin/firefox-nightly"
  install -m644 "${srcdir}/firefox-nightly.desktop" "${pkgdir}/usr/share/applications/"
  install -m644 "${srcdir}/firefox/browser/icons/mozicon128.png" "${pkgdir}/usr/share/pixmaps/firefox-nightly-icon.png"
  install -Dm644 "${srcdir}/vendor.js" "${pkgdir}/opt/firefox-nightly-ru/browser/defaults/preferences/vendor.js"
}
