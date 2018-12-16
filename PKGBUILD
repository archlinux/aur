# Maintainer: antsa <asss1924@gmail.com>
# Contributor: Gordin <9ordin@gmail.com>

pkgname=firefox-nightly-de
pkgdesc='Standalone Web Browser from Mozilla — Nightly build (de-DE)'
url='https://www.mozilla.org/de-DE/firefox/nightly'
pkgver=66.0a1
pkgrel=1
arch=('i686' 'x86_64')
license=('MPL' 'GPL' 'LGPL')

source=('firefox-nightly.desktop' 'firefox-nightly-safe.desktop' 'policies.json')
source_i686=("https://ftp.mozilla.org/pub/firefox/nightly/latest-mozilla-central-l10n/firefox-${pkgver}.de.linux-i686.tar.bz2"{,.asc})
source_x86_64=("https://ftp.mozilla.org/pub/firefox/nightly/latest-mozilla-central-l10n/firefox-${pkgver}.de.linux-x86_64.tar.bz2"{,.asc})

sha512sums=('df3c93f66b9ef30cf8b7301d288328503d796a0e79f994a1650dac900a8071719bb9d5e9c1135e1284c874732dc7c1e2032ecfb921799fb6b1ff50329f362308'
  '2f7e6aa935542e324eaa09f90a4f972716218c70299776a3476db7e7f2feee1a36c3cd35e51105b3d483436c02dedf5166656de6b58c7efed97d0480f8fc05fc'
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
  cp -r firefox "${pkgdir}/opt/firefox-${pkgver}"
  ln -s /opt/firefox-${pkgver}/firefox "${pkgdir}/usr/bin/firefox-nightly"

  install -m644 "${srcdir}"/{firefox-nightly.desktop,firefox-nightly-safe.desktop} "${pkgdir}/usr/share/applications/"

  install -m644 "${srcdir}/firefox/browser/chrome/icons/default/default128.png" "${pkgdir}/usr/share/pixmaps/${pkgname}-icon.png"

  # Disabling auto updates
  install -Dm644 "${srcdir}/policies.json" -t "${pkgdir}/opt/firefox-${pkgver}/distribution"
}
