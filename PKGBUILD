# Maintainer: antsa <asss1924@gmail.com>
# Contributor: Gordin <9ordin@gmail.com>

pkgname=firefox-nightly-de
pkgdesc='Standalone Web Browser from Mozilla — Nightly build (de-DE)'
url='https://www.mozilla.org/de-DE/firefox/nightly'
pkgver=72.0a1
pkgrel=1
arch=('i686' 'x86_64')
license=('MPL' 'GPL' 'LGPL')

source=('firefox-nightly.desktop' 'policies.json')
source_i686=("https://ftp.mozilla.org/pub/firefox/nightly/latest-mozilla-central-l10n/firefox-${pkgver}.de.linux-i686.tar.bz2"{,.asc})
source_x86_64=("https://ftp.mozilla.org/pub/firefox/nightly/latest-mozilla-central-l10n/firefox-${pkgver}.de.linux-x86_64.tar.bz2"{,.asc})

sha512sums=('7e950fbcdd7e0bd972038e3be158ba7ee5e0c0a3c9fc4778a7525e23ca7ab1dfff7ee7b14747651ca8666bd3000011c40074e53f1101e4d2bd3ca3721051cddf'
  '5ed67bde39175d4d10d50ba5b12063961e725e94948eadb354c0588b30d3f97d2178b66c1af466a6e7bd208ab694227a1391c4141f88d3da1a1178454eba5308')
sha512sums_i686=('SKIP' 'SKIP')
sha512sums_x86_64=('SKIP' 'SKIP')
validpgpkeys=('14F26682D0916CDD81E37B6D61B7B526D98F0353')

depends=('dbus-glib' 'gtk3' 'libxt' 'nss' 'mime-types')
optdepends=('pulseaudio: audio support'
            'ffmpeg: h.264 video'
            'gtk2: flash plugin support'
            'hunspell: spell checking'
            'hyphen: hyphenation'
            'libnotify: notification integration'
            'networkmanager: location detection via available WiFi networks'
            'speech-dispatcher: text-to-speech'
            'startup-notification: support for FreeDesktop Startup Notification')

conflicts=('firefox-nightly')
provides=('firefox-nightly')

package() {
  install -d "${pkgdir}"/{usr/{bin,share/{applications,pixmaps}},opt}
  cp -r firefox "${pkgdir}/opt/firefox-nightly"
  ln -s /opt/firefox-nightly/firefox "${pkgdir}/usr/bin/firefox-nightly"

  install -m644 "${srcdir}"/firefox-nightly.desktop "${pkgdir}/usr/share/applications/"

  install -m644 "${srcdir}/firefox/browser/chrome/icons/default/default128.png" "${pkgdir}/usr/share/pixmaps/firefox-nightly-icon.png"

  # Disabling auto updates
  install -Dm644 "${srcdir}/policies.json" -t "${pkgdir}/opt/firefox-nightly/distribution"
}
