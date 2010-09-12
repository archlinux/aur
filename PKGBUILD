# Maintainer: Daenyth
# Contributor: Ronald van Haren <ronald.archlinux.org>
# Contributor: Alessio 'mOLOk' Bolognino <themolok@gmail.com>

pkgname=youtube-dl
pkgver=2010.08.04
pkgrel=2
pkgdesc='A small command-line program to download videos from YouTube.com'
arch=('any')
url='http://bitbucket.org/rg3/youtube-dl/'
license=('MIT')
depends=('python2')
source=("http://bitbucket.org/rg3/${pkgname}/raw/${pkgver}/${pkgname}")
md5sums=('8b1b8b922b758aae28f6c158e9a1baba')

package() {
  sed -i 's|#!/usr/bin/env python|#!/usr/bin/env python2|' ${srcdir}/${pkgname}
  install -Dm755 ${srcdir}/${pkgname} ${pkgdir}/usr/bin/${pkgname}

  # install MIT license
  install -d ${pkgdir}/usr/share/licenses/$pkgname

  awk /Copy/,/import/ youtube-dl  | grep -v import \
    | sed -re 's/#?//'  > ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}
