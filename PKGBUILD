# Maintainer: Daenyth
# Contributor: Ronald van Haren <ronald.archlinux.org>
# Contributor: Alessio 'mOLOk' Bolognino <themolok@gmail.com>

pkgname=youtube-dl
pkgver=2011.01.30
pkgrel=1
pkgdesc='A small command-line program to download videos from YouTube.com'
arch=('any')
url='http://rg3.github.com/youtube-dl/'
license=('MIT')
depends=('python2')
source=("https://github.com/rg3/${pkgname}/raw/${pkgver}/${pkgname}")
md5sums=('2137453c9e9dde9612d37941eb74a4fb')

package() {
  sed -i 's|#!/usr/bin/env python|#!/usr/bin/env python2|' ${srcdir}/${pkgname}
  install -Dm755 ${srcdir}/${pkgname} ${pkgdir}/usr/bin/${pkgname}

  # install MIT license
  install -d ${pkgdir}/usr/share/licenses/$pkgname

  awk /Copy/,/import/ youtube-dl  | grep -v import \
    | sed -re 's/#?//'  > ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}

