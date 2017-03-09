# Maintainer: coldphoenix <coldphoenix000@gmail.com>
# Contributor: pj1031999 <pj1031999@gmail.com>  
# Contributor: Cedric MATHIEU <me.xenom@gmail.com>
# Contributor: Det <nimetonmaili@gmail.com>
# Contributor: coderoar <coderoar@gmail.com>
# Contributor: Ravicious <ravicious@gmail.com>


#Please add pgp key if you can't build because of unverifiable signature:
#pgp --keyserver pgp.mit.edu --recv-keys 14F26682D0916CDD81E37B6D61B7B526D98F0353

pkgname=firefox-nightly-pl
pkgdesc='Standalone web browser from mozilla.org, nightly build, Polish l10n'
pkgver=55.0a1
pkgrel=1
arch=('i686' 'x86_64')
license=('MPL' 'GPL' 'LGPL')
url="https://nightly.mozilla.org/"
source=("https://ftp.mozilla.org/pub/firefox/nightly/latest-mozilla-central-l10n/firefox-${pkgver}.pl.linux-${CARCH}.tar.bz2"{,.asc}
		'firefox-nightly.desktop' 'firefox-nightly-safe.desktop' 'vendor.js')
sha1sums=('SKIP'
		  'SKIP'
          'd998c8a825bb0f58594f822a2e2fbb7c0a1a3ce8'
          'd98f7a35fd423a9701dcaef7d4bbffee939198c7'
          'eee3e295625d5b58bddb708c08d9aba2bf8fa621')
validpgpkeys=('14F26682D0916CDD81E37B6D61B7B526D98F0353')
depends=('alsa-lib' 'libxt' 'libnotify' 'mime-types' 'nss' 'gtk2' 'sqlite' 'dbus-glib')

package() {
  mkdir -p "${pkgdir}"/{usr/{bin,share/{applications,pixmaps}},opt}
  cp -r firefox "${pkgdir}/opt/firefox-${pkgver}"

  ln -s /opt/firefox-${pkgver}/firefox "${pkgdir}/usr/bin/firefox-nightly"
  install -m644 "${srcdir}"/{firefox-nightly.desktop,firefox-nightly-safe.desktop} "${pkgdir}/usr/share/applications/"
  install -m644 "${srcdir}/firefox/browser/icons/mozicon128.png" "${pkgdir}/usr/share/pixmaps/firefox-nightly-icon.png"
  install -Dm644 "${srcdir}/vendor.js" "${pkgdir}/opt/firefox-${_version}/browser/defaults/preferences/vendor.js"
}
