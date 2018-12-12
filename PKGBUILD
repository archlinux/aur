# Maintainer: Moacir R.F <moacirrf@gmail.com>
_basename="SceneBuilder-11"
_originalbasename="SceneBuilder"
pkgname="javafx11-scenebuilder"
_debpkg=scenebuilder
pkgver="11.0.0"
pkgrel=0
pkgdesc="The release candidate version of 
Gluon Scene Builder for Java 11, it was released on Nov 23, 2018."
arch=('x86_64' 'i686')
url="http://gluonhq.com/labs/scene-builder/"
license=('BSD License')
depends=('libarchive')
makedepends=()
optdepends=()
install=
source=(https://download2.gluonhq.com/scenebuilder/RC/$pkgver/$_debpkg"-"$pkgver".deb")
sha1sums=('f1de8c24910133672dad126bfc2d9a011c566341') 
build() {
  cd "$srcdir/"
  tar -xf data.tar.xz
  mv "${srcdir}/opt/${_originalbasename}" "${srcdir}/opt/${_basename}"
  mv "${srcdir}/opt/${_basename}/${_originalbasename}.desktop" "${srcdir}/opt/${_basename}/${_basename}.desktop"
  mv "${srcdir}/opt/${_basename}/${_originalbasename}.png" "${srcdir}/opt/${_basename}/${_basename}.png"
echo "[Desktop Entry]
Name=Scene Builder 11 RC
Comment=Gluon Scene Builder RC for Java 11
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

