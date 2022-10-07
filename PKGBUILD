# Maintainer: Moacir R.F <moacirrf@gmail.com>
_basename="scenebuilder"
pkgname="javafx-scenebuilder"
_debpkg="SceneBuilder"
pkgver="19.0.0"
_pkgver=$pkgver
pkgrel=0
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
sha256sums=('1f1e9d8da19ec5d5ffeae60a783035ec2e887dc8eb0b1e17a20e2fd56e5ea8fb')
build() {
  cd "$srcdir/"
  tar -xf data.tar.xz
echo "[Desktop Entry]
Name=Scene Builder $_pkgver
Comment=Gluon Scene Builder for Java 11 and higher.
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
