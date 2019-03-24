# Maintainer: Moacir R.F <moacirrf@gmail.com>
_basename="SceneBuilder-11"
_originalbasename="SceneBuilder"
pkgname="javafx11-scenebuilder"
_debpkg=scenebuilder
pkgver="11.0.0"
pkgrel=1
pkgdesc="The latest version of Scene Builder for Java 11 is 11.0.0."
arch=('x86_64' 'i686')
url="http://gluonhq.com/labs/scene-builder/"
license=('BSD License')
depends=('libarchive')
makedepends=()
optdepends=()
install=
source=(https://download2.gluonhq.com/scenebuilder/$pkgver/install/linux/$_debpkg"-"$pkgver".deb")
sha1sums=('593b33970b01b569128075e53b609122016a455f') 
build() {
  cd "$srcdir/"
  tar -xf data.tar.xz
  mv "${srcdir}/opt/${_originalbasename}" "${srcdir}/opt/${_basename}"
  mv "${srcdir}/opt/${_basename}/${_originalbasename}.desktop" "${srcdir}/opt/${_basename}/${_basename}.desktop"
  mv "${srcdir}/opt/${_basename}/${_originalbasename}.png" "${srcdir}/opt/${_basename}/${_basename}.png"
echo "[Desktop Entry]
Name=Scene Builder 11
Comment=Gluon Scene Builder for Java 11
Exec=/opt/${_basename}/${_originalbasename}
Icon=/opt/${_basename}/${_basename}.png
Terminal=false
Type=Application
Categories=Development;GTK;">"${srcdir}/opt/${_basename}/${_basename}.desktop"
}

package() {
  cp -rf "$srcdir/opt" "$pkgdir"
  install -d "${pkgdir}/usr/share/applications/"
  install -d "${pkgdir}/usr/share/pixmaps/"
  install -d "${pkgdir}/usr/bin/"
  ln -s "/opt/${_basename}/${_originalbasename}" "${pkgdir}/usr/bin/${pkgname}"
  install -m644 "${srcdir}/opt/${_basename}/${_basename}.desktop" "${pkgdir}/usr/share/applications/"
  install -m644 "${srcdir}/opt/${_basename}/${_basename}.png" "${pkgdir}/usr/share/pixmaps/"
}

