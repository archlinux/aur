# $Id: PKGBUILD 266875 2017-11-15 14:29:11Z foutrelis $
# Maintainer: Giovanni Scafora <giovanni@archlinux.org>
# Contributor: Matthew Sharpe <matt.sharpe@gmail.com>

pkgname=nvdock
pkgver=1.02
pkgrel=5
pkgdesc="A tray icon for easy launching of the NVIDIA control panel"
arch=('x86_64')
url="http://www.opsat.net/user/bob/projects/nvdock"
license=('BSD')
depends=('gtk2')
source=("https://storage.googleapis.com/google-code-archive-downloads/v2/code.google.com/bobmajdakjr/${pkgname}-${pkgver}.tar.bz2"
        "fix-build.patch")
md5sums=('e18c4eeff936dc3b671fd8b5a9bb5145'
         'e16d729d78e761e1015bd3b06876cb2f')

prepare() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  # Remove unneeded glib build dependency (FS#40523)
  patch -Np1 -i ../fix-build.patch
}

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  install -D -m755 build/nvdock "${pkgdir}/usr/bin/nvdock"
  install -D -m644 data/nvdock.png "${pkgdir}/usr/share/pixmaps/nvdock.png"
  install -D -m644 data/nvdock.desktop "${pkgdir}/usr/share/applications/nvdock.desktop"

  # Install license
  install -D COPYING "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
