# Maintainer: Gordin <9ordin @t gmail dot com>
# Contributor: Cedric MATHIEU <me.xenom @ gmail.com>
# Contributor : Det <nimetonmaili @ gmail.com>
# Contributor: coderoar <coderoar @ gmail.com>

pkgname=firefox-nightly-de
pkgdesc='Standalone web browser from mozilla.org, nightly build, german'
url='http://www.mozilla.org/projects/firefox'
pkgver=41.0a1
pkgrel=1
arch=('i686' 'x86_64')
license=('MPL' 'GPL' 'LGPL')
source=('firefox-nightly.desktop' 'firefox-nightly-safe.desktop')
sha1sums=('628027fb884e45903af21c09fd3474556ac6da56' 'cecfda3254e589cef2e61779a9f2a3b28b4d9fcc')
depends=('desktop-file-utils' 'libxt' 'mime-types' 'nss' 'alsa-lib' 'libnotify')
conflicts=('firefox-nightly')
provides=('firefox-nightly')
install=firefox.install


package() {
  FX_SRC="firefox-${pkgver}.de.linux-${CARCH}.tar.bz2"
  FX_SRC_URI="https://ftp.mozilla.org/pub/firefox/nightly/latest-mozilla-central-l10n/${FX_SRC}"

  msg "Downloading..."
  wget -N ${FX_SRC_URI}
  msg "Extracting..."
  bsdtar -x -f ${FX_SRC}
  msg "Packaging..."

#   uncomment this line to remove these
#   rm -rf firefox/{extensions,plugins,searchplugins}

  mkdir -p "${pkgdir}"/{usr/{bin,share/{applications,pixmaps}},opt}
  cp -r firefox "${pkgdir}/opt/firefox-${pkgver}"

  ln -s /opt/firefox-${pkgver}/firefox "${pkgdir}/usr/bin/firefox-nightly"
  install -m644 "${srcdir}"/{firefox-nightly.desktop,firefox-nightly-safe.desktop} "${pkgdir}/usr/share/applications/"
  install -m644 "${srcdir}/firefox/browser/icons/mozicon128.png" "${pkgdir}/usr/share/pixmaps/firefox-nightly-icon.png"
  }
