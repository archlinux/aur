# Maintainer: antsa <asss1924@gmail.com>
# Contributor: Gordin <9ordin@gmail.com>

pkgname=firefox-nightly-de
pkgdesc='Standalone web browser from mozilla.org, nightly build, german'
url='https://nightly.mozilla.org'
pkgver=56.0a1
pkgrel=1
arch=('i686' 'x86_64')
license=('MPL' 'GPL' 'LGPL')
source=(
  'firefox-nightly.desktop' 'firefox-nightly-safe.desktop' 'vendor.js'
  "https://ftp.mozilla.org/pub/firefox/nightly/latest-mozilla-central-l10n/firefox-${pkgver}.de.linux-${CARCH}.tar.bz2"{,.asc})
sha512sums=('6318a38b87629153fd4214997449e64d3301a7a3e00410f95e83337fbba90a20176ca42dd45d09f23f4fb601ce316b78e056a965fd45288cc5eb04aacd37032a'
  '5393e3d7ee1bb093308749fccd5d3403a15c4a800079da20dabb07e77b81e32ad06acaedf09a05072ac4f7ca05efecf9824f4124530c0d6b9b2d72bd11b59219'
  'bae5a952d9b92e7a0ccc82f2caac3578e0368ea6676f0a4bc69d3ce276ef4f70802888f882dda53f9eb8e52911fb31e09ef497188bcd630762e1c0f5293cc010'
  'SKIP'
  'SKIP')
validpgpkeys=('14F26682D0916CDD81E37B6D61B7B526D98F0353')
depends=('alsa-lib' 'libxt' 'libnotify' 'mime-types' 'gtk2' 'gtk3' 'sqlite' 'dbus-glib')
conflicts=('firefox-nightly')
provides=('firefox-nightly')

package() {
  install -d "${pkgdir}"/{usr/{bin,share/{applications,pixmaps}},opt}
  cp -r firefox "${pkgdir}/opt/firefox-${pkgver}"

  ln -s /opt/firefox-${pkgver}/firefox "${pkgdir}/usr/bin/firefox-nightly"
  install -m644 "${srcdir}"/{firefox-nightly.desktop,firefox-nightly-safe.desktop} "${pkgdir}/usr/share/applications/"
  install -m644 "${srcdir}/firefox/browser/icons/mozicon128.png" "${pkgdir}/usr/share/pixmaps/${pkgname}-icon.png"
  install -Dm644 "${srcdir}/vendor.js" "${pkgdir}/opt/firefox-${pkgver}/browser/defaults/preferences/vendor.js"
}
