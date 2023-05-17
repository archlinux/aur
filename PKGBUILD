# Maintainer: Marco Steiger <marco (at) steiger (dot) online>
pkgname=thedude
pkgver=7.9
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
source=("${pkgname}-${pkgver}.exe::http://download.mikrotik.com/routeros/${pkgver}/dude-install-${pkgver}.exe"
        "${pkgname}.desktop"
        "${pkgname}.png"
        "${pkgname}")
sha256sums=('33142f897cb1bd5dc5a4137098399f01c0bcc6509e3e3b9f43883e2598955785'
            '037f296da60fa1e46f256f0b8314b4de467529dcbfe743b512bb29730ac05a18'
            'b2595e2c2c9980fd5a9b2a6bbd847a8cbb158a4c18e36e9002ccbec109b4eaa1'
            '08a7b0b10a034c6cbfbbd3a5d2b7e12c2ab2d7014563a39de9596f29f5a5961c')

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
