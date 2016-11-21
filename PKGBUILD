# Maintainer: Moacir R.F <moacirrf@gmail.com>
_basename="SceneBuilder"
pkgname="javafx-scenebuilder"
_debpkg=scenebuilder
pkgver="8.2.0"
pkgrel=1
pkgdesc="Gluon Scene Builder based on debian package, this version is regognized by Netbeans."
arch=('x86_64' 'i686')
url="http://gluonhq.com/labs/scene-builder/"
license=('BSD License')
depends=()
makedepends=()
optdepends=()
install=
if [ "$CARCH" = "x86_64" ]; then
    source=(http://download.gluonhq.com/scenebuilder/8.2.0/install/linux/$_debpkg"-"$pkgver"_"x64_64.deb)
    sha1sums=('b05d83cb64cffaa2ba07a4528f4b721752552182')
else
    source=(http://download.gluonhq.com/scenebuilder/8.2.0/install/linux/$_debpkg"-"$pkgver"."i386.deb)
    sha1sums=('2c3a9f22e4c69ccb156a0e87d6262328b310f0fc')
fi    


build() {
  cd "$srcdir/"
  tar -xf data.tar.xz
echo "[Desktop Entry]
Name=${_basename}
Comment=SceneBuilder
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
