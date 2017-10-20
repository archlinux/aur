# Maintainer Jonne Haß <me@jhass.eu>
pkgname=workflowy
pkgver=0.0.5
pkgrel=1
pkgdesc="Desktop app for workflowy.com, a note taking tool based on lists"
arch=('x86_64')
url="https://workflowy.com"
license=('custom')
depends=('fuse2')
_filename="WorkFlowy-$pkgver-x86_64.AppImage"
options=('!strip')
source=("https://github.com/workflowy/desktop/releases/download/v$pkgver/$_filename")

prepare() {
  cd "$srcdir"
  sed -i -e "s|Exec=AppRun|Exec=/opt/$_filename|" workflowy.desktop
}

package() {
  cd "$srcdir"
  install -Dm755 "$_filename" "$pkgdir/opt/$_filename"
  install -Dm644 workflowy.desktop "$pkgdir/usr/share/applications/workflowy.desktop"
  install -dm755 "$pkgdir/usr/share/icons/hicolor"
  cp -av usr/share/icons/default/* "$pkgdir/usr/share/icons/hicolor/"
  chmod -R a+rX "$pkgdir/usr/share/icons/hicolor"
}
sha256sums=('f723699db4e27415a9f65a7ae3c263911fcefa1e3ac188f0c31b56c30985a76c')
