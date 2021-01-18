# Maintainer: Moacir R.F <moacirrf@gmail.com>
_basename="SceneBuilder-8"
pkgname="javafx8-scenebuilder"
_debpkg=scenebuilder
pkgver="8.5.0"
pkgrel=1
pkgdesc="Gluon Scene Builder for Java 8, based on debian package, this version is recognized by Netbeans, it was released on Jun 5, 2018."
arch=('x86_64' 'i686')
url="http://gluonhq.com/labs/scene-builder/"
license=('BSD License')
depends=()
makedepends=()
optdepends=()
install=
source_x86_64=($_debpkg-$pkgver-x86_64.deb::http://download.gluonhq.com/scenebuilder/$pkgver/install/linux/$_debpkg-$pkgver.deb)
source_i686=($_debpkg-$pkgver-i686.deb::http://download.gluonhq.com/scenebuilder/$pkgver/install/linux-x86/$_debpkg-$pkgver.deb)
sha1sums_x86_64=('52bb179903b45de257fd76657404d340601e5b10')
sha1sums_i686=('f4df31a35b690a0c7de86b64fd513e188874dca9')


build() {
  cd "$srcdir/"
  tar -xf data.tar.xz
  mv "${srcdir}/opt/SceneBuilder" "${srcdir}/opt/${_basename}"
  mv "${srcdir}/opt/${_basename}/SceneBuilder.png" "${srcdir}/opt/${_basename}/${_basename}.png"

echo "[Desktop Entry]
Name=Scene Builder 8.5.0
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
