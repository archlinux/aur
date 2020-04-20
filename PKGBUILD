# Maintainer:  Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=gluon-scene-builder-8-bin
pkgver=8.5.0
pkgrel=1
_appname=scene-builder
pkgdesc="Open Source Drag & Drop UI Design tool for JavaFX, by Gluon (For Java 8)"
arch=('x86_64')
url='https://gluonhq.com/products/scene-builder'
license=('BSD')
provides=('gluon-scene-builder-8' 'gluon-scene-builder')
conflicts=('gluon-scene-builder-11')
depends=('java-environment=11')
makedepends=('gendesk')
conflicts=('javafx-scenebuilder')
source=("https://download2.gluonhq.com/scenebuilder/${pkgver}/install/linux/scenebuilder-${pkgver}-1.x86_64.rpm")
sha256sums=('c7242c4bfd3dde295462eef4c978387e15faf7d44627f74eb194c483b631f36c')

package() {
  cp -aR "${srcdir}"/opt "${pkgdir}"
  cd "${pkgdir}/opt/SceneBuilder"
  mkdir -p "${pkgdir}/usr/bin"
  mkdir -p "${pkgdir}/usr/share/applications"
  mkdir -p "${pkgdir}/usr/share/pixmaps"
  ln -s /opt/SceneBuilder/SceneBuilder "${pkgdir}/usr/bin/${_appname}"
  install -Dm644 app/LICENSE "${pkgdir}/usr/share/licenses/${_appname}/LICENSE"
  mv SceneBuilder.png "${pkgdir}/usr/share/pixmaps/${_appname}.png"
  gendesk -f -n --pkgname "${_appname}" --name "Gluon Scene Builder 8" \
   --pkgdesc "${pkgdesc}" --exec="${_appname}" \
   --categories=Application\;Development\;Java --icon "${_appname}"
  install -Dm644 "${_appname}".desktop -t "${pkgdir}/usr/share/applications/"
  rm *.desktop
  rm app/LICENSE
}