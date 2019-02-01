# Maintainer: vitamin1980 <vitamin.novgorod @ yandex.ru>
# Contributor: McModder <mcmodder @ mcmodder.ru>
# Contributor: Denis Vadimov <me @ bloody.pw>

_version=67.0a1
_baseurl="https://ftp.mozilla.org/pub/firefox/nightly/latest-mozilla-central-l10n/"
_date="$(date +%Y%m%d)"
_filename="firefox-${_version}.ru.linux"
pkgname=firefox-nightly-ru
pkgver=${_version}.${_date}
pkgrel=1
pkgdesc='Web browser from mozilla.org, nightly build, russian version'
arch=('i686' 'x86_64')
url='http://nightly.mozilla.org/'
license=('MPL' 'GPL' 'LGPL')
depends=('dbus-glib' 'gtk3' 'libxt' 'nss' 'mime-types')
optdepends=('pulseaudio: audio support'
            'ffmpeg: h.264 video'
            'hunspell: spell checking'
            'hyphen: hyphenation'
            'libnotify: notification integration'
            'networkmanager: location detection via available WiFi networks'
            'speech-dispatcher: text-to-speech'
            'startup-notification: support for FreeDesktop Startup Notification')
conflicts=('firefox-nightly')
source=('firefox-nightly.desktop'
        'policies.json')
source_i686=("${_date}-${_filename}.tar.bz2::${_baseurl}${_filename}-i686.tar.bz2"
        "${_date}-${_filename}.tar.bz2.asc::${_baseurl}${_filename}-i686.tar.bz2.asc")
source_x86_64=("${_date}-${_filename}.tar.bz2::${_baseurl}${_filename}-x86_64.tar.bz2"
        "${_date}-${_filename}.tar.bz2.asc::${_baseurl}${_filename}-x86_64.tar.bz2.asc")
sha512sums=('02bd8c8c717e6796fb1772f51c1bfd78ff3ca7c5355c08b9568dc36cb72b8b84330d20522653eedda12bdec1517cd4074a4bc5d51a8667880121e946b85c11ec'
         '5ed67bde39175d4d10d50ba5b12063961e725e94948eadb354c0588b30d3f97d2178b66c1af466a6e7bd208ab694227a1391c4141f88d3da1a1178454eba5308')
sha512sums_i686=('SKIP' 'SKIP')
sha512sums_x86_64=('SKIP' 'SKIP')
validpgpkeys=("14F26682D0916CDD81E37B6D61B7B526D98F0353")

pkgver() {
  echo "${_version}.${_date}"
}

package() {
  mkdir -p "${pkgdir}"/{usr/{bin,share/{applications,pixmaps}},opt}
  cp -r firefox "${pkgdir}/opt/firefox-nightly-ru"
  ln -s /opt/firefox-nightly-ru/firefox "${pkgdir}/usr/bin/firefox-nightly"
  install -m644 "${srcdir}/firefox-nightly.desktop" "${pkgdir}/usr/share/applications/"
  install -m644 "${srcdir}/firefox/browser/chrome/icons/default/default128.png" "${pkgdir}/usr/share/pixmaps/firefox-nightly-icon.png"
  install -Dm644 "${srcdir}/policies.json" "${pkgdir}/opt/firefox-nightly-ru/distribution"
}
