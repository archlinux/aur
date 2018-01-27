# Maintainer: antsa <asss1924@gmail.com>
# Contributor: Gordin <9ordin@gmail.com>

pkgname=firefox-nightly-de
pkgdesc='Standalone web browser from mozilla.org, nightly build, german'
url='https://nightly.mozilla.org'
pkgver=60.0a1
pkgrel=1
arch=('i686' 'x86_64')
license=('MPL' 'GPL' 'LGPL')

source=('firefox-nightly.desktop' 'firefox-nightly-safe.desktop' 'vendor.js')
source_i686=("https://ftp.mozilla.org/pub/firefox/nightly/latest-mozilla-central-l10n/firefox-${pkgver}.de.linux-i686.tar.bz2"{,.asc})
source_x86_64=("https://ftp.mozilla.org/pub/firefox/nightly/latest-mozilla-central-l10n/firefox-${pkgver}.de.linux-x86_64.tar.bz2"{,.asc})

sha512sums=('6318a38b87629153fd4214997449e64d3301a7a3e00410f95e83337fbba90a20176ca42dd45d09f23f4fb601ce316b78e056a965fd45288cc5eb04aacd37032a'
  '5393e3d7ee1bb093308749fccd5d3403a15c4a800079da20dabb07e77b81e32ad06acaedf09a05072ac4f7ca05efecf9824f4124530c0d6b9b2d72bd11b59219'
  'bae5a952d9b92e7a0ccc82f2caac3578e0368ea6676f0a4bc69d3ce276ef4f70802888f882dda53f9eb8e52911fb31e09ef497188bcd630762e1c0f5293cc010')
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

  install -Dm644 "${srcdir}/vendor.js" "${pkgdir}/opt/firefox-${pkgver}/browser/defaults/preferences/vendor.js"
}
