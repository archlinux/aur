# Maintainer: Eric Bélanger <eric@archlinux.org>

pkgname=youtube-dl
pkgver=2011.03.29
pkgrel=2
pkgdesc="A small command-line program to download videos from YouTube.com and a few more sites"
arch=('any')
url="http://rg3.github.com/youtube-dl/"
license=('custom:public domain')
depends=('python2')
source=("https://github.com/rg3/${pkgname}/raw/${pkgver}/${pkgname}"
         support-playlist-urls.patch)
md5sums=('d481c3e15e306e3e5157e0142758c011'
         '562f5a71679f8f6ee5b5653ff9b9874f')

package() {
  cd "${srcdir}"

  # Fix FS#24506: Unable to download playlists
  patch -Np1 -i "${srcdir}/support-playlist-urls.patch"

  sed -i 's|#!/usr/bin/env python|#!/usr/bin/env python2|' youtube-dl
  install -D -m755 youtube-dl "${pkgdir}/usr/bin/youtube-dl"
  install -d "${pkgdir}/usr/share/licenses/${pkgname}"
  grep License youtube-dl  > "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
