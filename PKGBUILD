# Maintainer: Moacir R.F <moacirrf@gmail.com>
_basename="SceneBuilder-15"
pkgname="javafx15-scenebuilder"
_debpkg=SceneBuilder
pkgver="15.0.0"
_pkgver="15.0.0"
pkgrel=1
pkgdesc="Scene Builder 15.0.0 was released on Jan 8, 2021."
arch=('x86_64' 'i686')
url="http://gluonhq.com/labs/scene-builder/"
license=('BSD License')
depends=('libarchive')
makedepends=()
optdepends=()
install=
source=(https://download2.gluonhq.com/scenebuilder/15.0.0/install/linux/$_debpkg"-"$_pkgver".deb")
sha1sums=('d608d989ae039722583fb7a64b34955477e31463') 
build() {
  cd "$srcdir/"
  tar -xf data.tar.xz
  mv "${srcdir}/opt/scenebuilder" "${srcdir}/opt/${_basename}"
  mv "${srcdir}/opt/${_basename}/lib/scenebuilder-SceneBuilder.desktop" "${srcdir}/opt/${_basename}/lib/${_basename}.desktop"
  mv "${srcdir}/opt/${_basename}/lib/SceneBuilder.png" "${srcdir}/opt/${_basename}/lib/${_basename}.png"
echo "[Desktop Entry]
Name=Scene Builder 15.0.0
Comment=Gluon Scene Builder for Java 15.0.0
Exec=/opt/${_basename}/bin/SceneBuilder
Icon=/opt/${_basename}/lib/${_basename}.png
Terminal=false
Type=Application
Categories=Development;GTK;">"${srcdir}/opt/${_basename}/lib/${_basename}.desktop"
}

package() {
  cp -rf "$srcdir/opt" "$pkgdir"
  install -d "${pkgdir}/usr/share/applications/"
  install -d "${pkgdir}/usr/share/pixmaps/"
  install -d "${pkgdir}/usr/bin/"
  ln -s "/opt/${_basename}/bin/SceneBuilder" "${pkgdir}/usr/bin/${pkgname}"
  install -m644 "${srcdir}/opt/${_basename}/lib/${_basename}.desktop" "${pkgdir}/usr/share/applications/"
  install -m644 "${srcdir}/opt/${_basename}/lib/${_basename}.png" "${pkgdir}/usr/share/pixmaps/"
}

