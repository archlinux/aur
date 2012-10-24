# Maintainer: Eric Bélanger <eric@archlinux.org>

pkgname=youtube-dl
pkgver=2012.10.09
pkgrel=1
pkgdesc='Small command-line program to download videos from YouTube.com and a few more sites'
arch=('any')
url="http://rg3.github.com/youtube-dl/"
license=('custom')
depends=('python2')
makedepends=('unzip' 'zip')
source=(${pkgname}-${pkgver}::https://github.com/rg3/${pkgname}/raw/${pkgver}/${pkgname})
sha1sums=('8ae1c8d78ae979c8a84a7802e57f8c298dcabac7')

build() {
  cd "${srcdir}"
# Ignoring non-zero exit status of unzip as extraction is successful
  unzip -q ${pkgname}-${pkgver} || :
  zip -q youtube-dl *.py
  echo '#!/usr/bin/env python2' > youtube-dl
  cat youtube-dl.zip >> youtube-dl
}

package() {
  cd "${srcdir}"
  install -D -m755 youtube-dl "${pkgdir}/usr/bin/youtube-dl"
  install -d "${pkgdir}/usr/share/licenses/${pkgname}"
  grep -i license __init__.py > "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
