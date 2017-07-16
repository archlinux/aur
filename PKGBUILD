# Maintainer: Charlie Wolf <charlie@wolf.is>

pkgname=exponent-xde
pkgdesc="Exponent mobile app development environment"
pkgver=2.19.2
pkgrel=1
url="https://github.com/exponent/xde"
license=("MIT")
arch=("x86_64" "i686")
depends=('electron>=1.4.0')
makedepends=('gulp' 'yarn' 'asar')
source=("https://github.com/exponent/xde/archive/v${pkgver}.tar.gz" "exponent-xde.sh" "exponent-xde.desktop")
sha256sums=('83a52b7c44f74004d1023c5798b3978d4308989198c58e69bcefec334eb9558f' '4c805aaccb13588a5f57eb0b2b1da7378658c9202c5b1ca72315299be25d4f3e' '2ee241c2c267cbd5aa67318d4ea1f3c059fba9d4887e2ded60c8d04ca6ec402e')

build() {
  cd $srcdir/xde-${pkgver}/
  yarn
  cd app/
  yarn
  asar pack . $srcdir/app.asar
}

package() {
  install -dm755 "${pkgdir}/usr/share"
  install -dm755 "${pkgdir}/usr/share/${pkgname}"
  install -dm755 "${pkgdir}/usr/share/pixmaps"
  install -dm755 "${pkgdir}/usr/share/applications"
  install -dm755 "${pkgdir}/usr/bin"
  install -Dm644 "${srcdir}/xde-${pkgver}/app/web/ExponentLogoTrans.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
  install -Dm644 "${srcdir}/${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
  install -Dm644 "${srcdir}/app.asar" "${pkgdir}/usr/share/${pkgname}/app.asar"
  install -Dm755 "${srcdir}/${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"
}

