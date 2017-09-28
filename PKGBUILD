# Maintainer: Moacir R.F <moacirrf@gmail.com>
_basename="SceneBuilder"
pkgname="javafx-scenebuilder"
_debpkg=scenebuilder
pkgver="8.4.0"
pkgrel=1
pkgdesc="Gluon Scene Builder for Java 8, based on debian package, this version is regognized by Netbeans,it was released on Sep 26, 2017."
arch=('x86_64' 'i686')
url="http://gluonhq.com/labs/scene-builder/"
license=('BSD License')
depends=()
makedepends=()
optdepends=()
install=
if [ "$CARCH" = "x86_64" ]; then
    source=(http://download.gluonhq.com/scenebuilder/$pkgver/install/linux/$_debpkg"-"$pkgver".deb")
    sha1sums=('b3fe3e52946844d439a6c89009ed422d9ce8423f')
else
    source=(http://download.gluonhq.com/scenebuilder/$pkgver/install/linux-x86/$_debpkg"-"$pkgver".deb")
    sha1sums=('6dc6f844338d72f2adeebc1aa45bce1ba24acb78')
fi    


build() {
  cd "$srcdir/"
  tar -xf data.tar.xz
echo "[Desktop Entry]
Name=Scene Builder
Comment=Gluon Scene Builder for Java 8.
Exec=/opt/${_basename}/${_basename}
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
  ln -s "/opt/${_basename}/${_basename}" "${pkgdir}/usr/bin/${pkgname}"
  install -m644 "${srcdir}/opt/${_basename}/${_basename}.desktop" "${pkgdir}/usr/share/applications/"
  install -m644 "${srcdir}/opt/${_basename}/${_basename}.png" "${pkgdir}/usr/share/pixmaps/"
}
