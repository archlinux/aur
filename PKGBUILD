# $Id: PKGBUILD 266875 2017-11-15 14:29:11Z foutrelis $
# Maintainer: Giovanni Scafora <giovanni@archlinux.org>

pkgname=tdfsb
pkgver=0.0.10
pkgrel=7
pkgdesc="SDL based graphical file browser"
arch=('x86_64')
url="http://www.determinate.net/webdata/seg/tdfsb.html"
license=('GPL')
depends=('smpeg' 'freeglut' 'sdl_image' 'libxmu' 'glu')
source=("http://www.determinate.net/webdata/data/${pkgname}-${pkgver}.tar.gz"
        'tdfsb.desktop'
        'tdfsb.png')
md5sums=('8162994a7e882dc7074a5f628d2ac076'
         '4070a7de1153c00df875384a1817e43b'
         'ecabb39597a3c17f9541300869873e50')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  sed -i -e "s:-O2:${CFLAGS} ${LDFLAGS}:g" compile.sh
  ./compile.sh
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  install -D -m755 tdfsb "${pkgdir}/usr/bin/tdfsb"

  # Install desktop file
  install -D -m755 "${srcdir}/tdfsb.desktop" "${pkgdir}/usr/share/applications/tdfsb.desktop"
  # Install icon
  install -D -m644 "${srcdir}/tdfsb.png" "${pkgdir}/usr/share/pixmaps/tdfsb.png"
}
