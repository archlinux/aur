# Maintainer: cornholio <vigo.the.unholy.carpathian@gmail.com>
# Upstream Maintainer: Giovanni Scafora <giovanni@archlinux.org>
# Contributor: Matthew Sharpe <matt.sharpe@gmail.com>

pkgname=nvdock-bumblebee
pkgver=1.02
pkgrel=1
pkgdesc="A tray icon for easy launching of the NVIDIA control panel"
arch=('i686' 'x86_64')
url="http://www.opsat.net/user/bob/projects/nvdock"
license=('BSD')
provides=('nvdock')
conflicts=('nvdock')
depends=('gtk2')
source=("https://storage.googleapis.com/google-code-archive-downloads/v2/code.google.com/bobmajdakjr/nvdock-${pkgver}.tar.bz2"
        "fix-build.patch"
	"use-bumblebee.patch")
md5sums=('e18c4eeff936dc3b671fd8b5a9bb5145'
         'e16d729d78e761e1015bd3b06876cb2f'
	 '3b58520b41ba471c71a029491f26a5e5')

prepare() {
  cd "${srcdir}/nvdock-${pkgver}"

  # Remove unneeded glib build dependency (FS#40523)
  patch -Np1 -i ../fix-build.patch

  # Use bumblebee
  patch -Np1 -i ../use-bumblebee.patch
}

build() {
  cd "${srcdir}/nvdock-${pkgver}"

  make
}

package() {
  cd "${srcdir}/nvdock-${pkgver}"

  install -D -m755 build/nvdock "${pkgdir}/usr/bin/nvdock"
  install -D -m644 data/nvdock.png "${pkgdir}/usr/share/pixmaps/nvdock.png"
  install -D -m644 data/nvdock.desktop "${pkgdir}/usr/share/applications/nvdock.desktop"

  # Install license
  install -D COPYING "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
