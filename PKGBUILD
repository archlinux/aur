# Maintainer : zoe <chp321 at gmail dot com>
# Contributor: Josef Lusticky <evramp@gmail.com>

pkgname=urbanlightscape
pkgver=1.4.0
pkgrel=1
pkgdesc="A photo filter for exposure, brightness and lighting correction"
arch=(i686 x86_64)
url="http://www.indii.org/software/urbanlightscape"
license=('GPL')
depends=('wxgtk' 'desktop-file-utils')
makedepends=('boost')
source=("http://www.indii.org/files/${pkgname}/releases/${pkgname}-${pkgver}.tar.gz"
        "http://www.indii.org/images/${pkgname}_128.png" "${pkgname}.desktop")
md5sums=('e5097a9a48f2f2cde1d641380f050dc6'
         'b6940433e6e0bcd85fea1e311c520804'
         '295a61ac999850102e1330548b5a4d61')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  ./configure --prefix=/usr
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}/" install

  # desktop file
  install -Dm644 ../${pkgname}.desktop \
    "$pkgdir/usr/share/applications/${pkgname}.desktop"

  # icon
  install -Dm644 ../${pkgname}_128.png \
    "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
}

