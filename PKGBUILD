# Maintainer: Eric Bélanger <eric@archlinux.org>

pkgname=youtube-dl
pkgver=2012.12.11
pkgrel=2
pkgdesc="A small command-line program to download videos from YouTube.com and a few more sites"
arch=('any')
url="http://rg3.github.com/youtube-dl/"
license=('custom')
depends=('python2')
makedepends=('unzip' 'zip')
source=(${pkgname}-${pkgver}::https://github.com/downloads/rg3/youtube-dl/youtube-dl)
sha1sums=('aa45f8e32c637a2342674f32d1ca9e8f70bf695c')

build() {
  cd "${srcdir}"
# Ignoring non-zero exit status of unzip as extraction is successful
  unzip -q ${pkgname}-${pkgver} || :
  zip -q youtube-dl youtube_dl/* *.py
  echo '#!/usr/bin/env python2' > youtube-dl
  cat youtube-dl.zip >> youtube-dl
}

package() {
  cd "${srcdir}"
  install -D -m755 ${pkgname} "${pkgdir}/usr/bin/youtube-dl"
  install -d "${pkgdir}/usr/share/licenses/${pkgname}"
  echo "Public Domain" > "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
