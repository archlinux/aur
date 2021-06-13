# Maintainer : zoe <chp321 at gmail dot com>
# Contributor: Josef Lusticky <evramp@gmail.com>

pkgname=urbanlightscape
pkgver=1.4.0
pkgrel=4
pkgdesc="A photo filter for exposure, brightness and lighting correction"
arch=(i686 x86_64)
url="https://www.indii.org/software/urbanlightscape"
license=('GPL')
depends=('wxgtk' 'desktop-file-utils' 'bc')
makedepends=('boost')
source=("https://www.indii.org/files/${pkgname}/releases/${pkgname}-${pkgver}.tar.gz"
        "${pkgname}.png" "${pkgname}.desktop")
md5sums=('e5097a9a48f2f2cde1d641380f050dc6'
         'd15892b7d1d5cfd41297413099d7c97c'
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
  install -Dm644 ../${pkgname}.png \
    "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
}
