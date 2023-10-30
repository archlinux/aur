# Maintainer: Moacir R.F <moacirrf@gmail.com>
_basename="scenebuilder"
pkgname="javafx-scenebuilder"
_debpkg="SceneBuilder"
pkgver="21.0.1"
_pkgver=$pkgver
pkgrel=1
pkgdesc="Scene Builder is an open source tool that allows for drag and drop design of JavaFX user interfaces."
arch=('x86_64' 'i686')
url="https://gluonhq.com/products/scene-builder/"
license=('BSD License')
depends=('libarchive')
makedepends=()
optdepends=()
install=
conflicts=('gluon-scenebuilder')
source=(https://github.com/gluonhq/scenebuilder/releases/download/$_pkgver/$_debpkg"-"$_pkgver".deb")
sha256sums=('6148b0820cdebf582426285d6e6f690d8ec843ca9a13ff44615542c22f6282d5')
build() {
  cd "$srcdir/"
  tar -xf data.tar.xz
echo "[Desktop Entry]
Name=Scene Builder $_pkgver
Comment=Gluon Scene Builder for Java
Exec=/opt/$_basename/bin/SceneBuilder
Icon=/opt/$_basename/lib/SceneBuilder.png
Terminal=false
Type=Application
Categories=Development;GTK;">"$srcdir/opt/$_basename/lib/$_basename.desktop"
}

package() {
  cp -rf "$srcdir/opt" "$pkgdir"
  install -d "$pkgdir/usr/share/applications/"
  install -d "$pkgdir/usr/share/pixmaps/"
  install -d "$pkgdir/usr/bin/"
  ln -s "/opt/$_basename/bin/SceneBuilder" "$pkgdir/usr/bin/$pkgname"
  install -m644 "$srcdir/opt/$_basename/lib/$_basename.desktop" "$pkgdir/usr/share/applications/"
  install -m644 "$srcdir/opt/$_basename/lib/SceneBuilder.png" "$pkgdir/usr/share/pixmaps/"
}
