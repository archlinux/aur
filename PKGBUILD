# Maintainer: Marco Steiger <marco1steiger (at) gmail (dot) com>
pkgname=thedude
pkgver=6.45.1
pkgrel=1
pkgdesc="Mikrotik The Dude network monitoring client"
url="http://www.mikrotik.com"
arch=('x86_64' 'i686')
license=('custom')
makedepends=('p7zip')
depends=('findutils' 'wine')
optdepends=(
  'ttf-ms-fonts: for better fonts'
)
install=${pkgname}.install
source=("${pkgname}-${pkgver}.exe::http://download2.mikrotik.com/routeros/${pkgver}/dude-install-${pkgver}.exe"
        "${pkgname}.desktop"
        "${pkgname}.png"
        "${pkgname}")
sha256sums=('08cc998c99663e5c75e6f8e5b34ddf846f5eed7a0b55c87b4f6f0ef2996fd720'
            '037f296da60fa1e46f256f0b8314b4de467529dcbfe743b512bb29730ac05a18'
            'b2595e2c2c9980fd5a9b2a6bbd847a8cbb158a4c18e36e9002ccbec109b4eaa1'
            '95a12300ae46ee8aec5789c9fdb6da1ac91ab1cdf5044f54375fd65f24f43c8d')

build() {
  test ! -d ${srcdir}/${pkgname}-src && mkdir ${srcdir}/${pkgname}-src
  7z e -y -o"${srcdir}/${pkgname}-src/" "${srcdir}/${pkgname}-${pkgver}.exe"
}
package() {
  mkdir -p "${pkgdir}/usr/share/${pkgname}/"
  cp ${srcdir}/${pkgname}-src/* "${pkgdir}/usr/share/${pkgname}/"
  chmod u=rwX,go=rX "${pkgdir}/usr/share/${pkgname}"
  install -Dm755 "${srcdir}/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
  install -Dm655 "${srcdir}/${pkgname}.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
  install -Dm655 "${srcdir}/${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
}
