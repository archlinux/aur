# Maintainer: Eric Bélanger <eric@archlinux.org>

pkgname=youtube-dl
pkgver=2011.08.04
pkgrel=1
pkgdesc="A small command-line program to download videos from YouTube.com and a few more sites"
arch=('any')
url="http://rg3.github.com/youtube-dl/"
license=('custom')
depends=('python2')
source=(https://github.com/rg3/${pkgname}/raw/${pkgver}/${pkgname}
        support-playlist-urls.patch)
md5sums=('2538839c274fe7cd1568304e37545bde'
         '562f5a71679f8f6ee5b5653ff9b9874f')
sha1sums=('688d7aeec549fa7cca53ed6b06636d2b89748a0c'
          '9cf2f90e1be00b031b2995f74d93ba6b39445246')

package() {
  cd "${srcdir}"

  # Fix FS#24506: Unable to download playlists
  patch -Np1 -i "${srcdir}/support-playlist-urls.patch"

  sed -i 's|#!/usr/bin/env python|#!/usr/bin/env python2|' youtube-dl
  install -D -m755 youtube-dl "${pkgdir}/usr/bin/youtube-dl"
  install -d "${pkgdir}/usr/share/licenses/${pkgname}"
  grep License youtube-dl  > "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
