# Maintainer: Moacir R.F <moacirrf@gmail.com>
_basename="SceneBuilder-15"
pkgname="javafx15-scenebuilder"
_debpkg=SceneBuilder
pkgver="15.0.0RC1"
_pkgver="15.0.0-RC1"
pkgrel=0
pkgdesc="The latest release candidate version of Scene Builder is 15.0.0-RC1."
arch=('x86_64' 'i686')
url="http://gluonhq.com/labs/scene-builder/"
license=('BSD License')
depends=('libarchive')
makedepends=()
optdepends=()
install=
source=(https://download2.gluonhq.com/scenebuilder/RC/15.0.0-RC1/install/linux/$_debpkg"-"$_pkgver".deb")
sha1sums=('acf9342fe2391c5b8310dfd009c24b79a8ca9b59') 
build() {
  cd "$srcdir/"
  tar -xf data.tar.xz
  mv "${srcdir}/opt/scenebuilder" "${srcdir}/opt/${_basename}"
  mv "${srcdir}/opt/${_basename}/lib/scenebuilder-SceneBuilder.desktop" "${srcdir}/opt/${_basename}/lib/${_basename}.desktop"
  mv "${srcdir}/opt/${_basename}/lib/SceneBuilder.png" "${srcdir}/opt/${_basename}/lib/${_basename}.png"
echo "[Desktop Entry]
Name=Scene Builder 15.0.0-RC1
Comment=Gluon Scene Builder for Java 15.0.0-RC1
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

